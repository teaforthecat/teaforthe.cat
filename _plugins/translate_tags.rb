# Here we have the desired bits from https://github.com/kurtsson/jekyll-multiple-languages-plugin/tree/master
#
#

  #-----------------------------------------------------------------------------
  #
  # The next classes implements the plugin Liquid Tags and/or Filters
  #
  #-----------------------------------------------------------------------------


  ##############################################################################
  # class LocalizeTag
  #
  # Localization by getting localized text from YAML files.
  # User must use the "t" or "translate" liquid tags.
  ##############################################################################
  class LocalizeTag < Liquid::Tag

    #======================================
    # initialize
    #======================================
    def initialize(tag_name, key, tokens)
      super
      @key = key.strip
    end



    #======================================
    # render
    #======================================
    def render(context)
      if      "#{context[@key]}" != "" # Check for page variable
        key = "#{context[@key]}"
      else
        key =            @key
      end

      key = Liquid::Template.parse(key).render(context)  # Parses and renders some Liquid syntax on arguments (allows expansions)

      site = context.registers[:site] # Jekyll site object

      lang = site.config['lang']

      translation = site.parsed_translations[lang].access(key) if key.is_a?(String)

      if translation.nil? or translation.empty?
         translation = site.parsed_translations[site.config['default_lang']].access(key)

        if site.config["verbose"]
          puts "Missing i18n key: #{lang}:#{key}"
          puts "Using translation '%s' from default language: %s" %[translation, site.config['default_lang']]
        end
      end

      TranslatedString.translate(key, lang, site)

      translation
    end
  end


  ##############################################################################
  # class LocalizeInclude
  #
  # Localization by including whole files that contain the localization text.
  # User must use the "tf" or "translate_file" liquid tags.
  ##############################################################################
  module Tags
    class LocalizeInclude < IncludeTag

      #======================================
      # render
      #======================================
      def render(context)
        if       "#{context[@file]}" != "" # Check for page variable
          file = "#{context[@file]}"
        else
          file =            @file
        end

        file = Liquid::Template.parse(file).render(context)  # Parses and renders some Liquid syntax on arguments (allows expansions)

        site = context.registers[:site] # Jekyll site object

        default_lang = site.config['default_lang']

        validate_file_name(file)

        includes_dir = File.join(site.source, '_i18n/' + site.config['lang'])

        # If directory doesn't exist, go to default lang
        if !Dir.exist?(includes_dir)
          includes_dir = File.join(site.source, '_i18n/' + default_lang)
        elsif
          # If file doesn't exist, go to default lang
          Dir.chdir(includes_dir) do
            choices = Dir['**/*'].reject { |x| File.symlink?(x) }
            if !choices.include?(  file)
              includes_dir = File.join(site.source, '_i18n/' + default_lang)
            end
          end
        end

        Dir.chdir(includes_dir) do
          choices = Dir['**/*'].reject { |x| File.symlink?(x) }

          if choices.include?(  file)
            source  = File.read(file)
            partial = Liquid::Template.parse(source)

            context.stack do
              context['include'] = parse_params(  context) if @params
              contents           = partial.render(context)
              ext                = File.extname(file)

              converter = site.converters.find { |c| c.matches(ext) }
              contents  = converter.convert(contents) unless converter.nil?

              contents
            end
          else
            raise IOError.new "Included file '#{file}' not found in #{includes_dir} directory"
          end

        end
      end
    end

  ##############################################################################
  # class LocalizeLink
  #
  # Creates links or permalinks for translated pages.
  # User must use the "tl" or "translate_link" liquid tags.
  ##############################################################################
  class LocalizeLink < Liquid::Tag

    #======================================
    # initialize
    #======================================
    def initialize(tag_name, key, tokens)
      super
      @key = key
    end



    #======================================
    # render
    #======================================
    def render(context)
      if      "#{context[@key]}" != "" # Check for page variable
        key = "#{context[@key]}"
      else
        key = @key
      end

      key = Liquid::Template.parse(key).render(context)  # Parses and renders some Liquid syntax on arguments (allows expansions)

      site = context.registers[:site] # Jekyll site object

      key          = key.split
      namespace    = key[0]
      lang         = key[1] || site.config[        'lang']
      default_lang =           site.config['default_lang']
      baseurl      =           site.baseurl
      pages        =           site.pages
      url          = "";

      if default_lang != lang || site.config['default_locale_in_subfolder']
        baseurl = baseurl + "/" + lang
      end

      collections = site.collections.values.collect{|x| x.docs}.flatten
      pages = site.pages + collections

      for p in pages
        unless             p['namespace'].nil?
          page_namespace = p['namespace']

          if namespace == page_namespace
            permalink = p['permalink_'+lang] || p['permalink']
            url       = baseurl + permalink
          end
        end
      end

      url
    end
  end


end # End module Jekyll


################################################################################
# class Hash
################################################################################
unless Hash.method_defined? :access
  class Hash

    #======================================
    # access
    #======================================
    def access(path)
      ret = self

      path.split('.').each do |p|

        if p.to_i.to_s == p
          ret = ret[p.to_i]
        else
          ret = ret[p.to_s] || ret[p.to_sym]
        end

        break unless ret
      end

      ret
    end
  end
end



#======================================
# translate_key
#
# Translate given key to given language.
#======================================
def translate_key(key, lang, site)
  translation = site.parsed_translations[lang].access(key) if key.is_a?(String)

  if translation.nil? or translation.empty?
    translation = site.parsed_translations[site.config['default_lang']].access(key)

    puts "Missing i18n key: #{lang}:#{key}"
    puts "Using translation '%s' from default language: %s" %[translation, site.config['default_lang']]
  end

  translation
end


################################################################################
# class TranslatedString
################################################################################
class TranslatedString < String
  #======================================
  # initialize
  #======================================
  def initialize(*several_variants, key)
    super(*several_variants)
    @key = key
  end

  def key
    @key
  end

  #======================================
  # translate
  #======================================
  def self.translate(str, lang, site)
    if str.is_a?(TranslatedString)
      key = str.key
    else
      key = str
    end
    return TranslatedString.new(translate_key(key, lang, site), key = key)
  end
end


#======================================
# translate_props
#
# Perform translation of properties defined in translation property list.
#======================================
def translate_props(data, site, props_key_name = 'translate_props')
  lang = site.config['lang']
  (data[props_key_name] || []).each do |prop_name|
    if prop_name.is_a?(String)
      prop_name = prop_name.strip
      if prop_name.empty?
        puts "There is an empty property defined in '#{props_key_name}'"
      else
        prop_value = data[prop_name]
        if prop_value.is_a?(String) and !prop_value.empty?
          data[prop_name] = TranslatedString.translate(prop_value, lang, site)
        end
      end
    else
      puts "Incorrect property name '#{prop_name}'. Must be a string"
    end
  end
end


################################################################################
# Liquid tags definitions

Liquid::Template.register_tag('t',              Jekyll::LocalizeTag          )
Liquid::Template.register_tag('translate',      Jekyll::LocalizeTag          )
Liquid::Template.register_tag('tf',             Jekyll::Tags::LocalizeInclude)
Liquid::Template.register_tag('translate_file', Jekyll::Tags::LocalizeInclude)
Liquid::Template.register_tag('tl',             Jekyll::LocalizeLink         )
Liquid::Template.register_tag('translate_link', Jekyll::LocalizeLink         )
