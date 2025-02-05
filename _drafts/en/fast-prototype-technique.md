# Fast Prototype Technique


rails new {name} -d postgresql -T -c tailwind 

cd {name}
bundle add haml-rails html2haml
rails generate haml:application_layout convert
rm app/views/layouts/application.html.erb
bundle remove html2haml
bundle add rspec-rails factory_bot_rails capybara launchy
rails g rspec:install
rails db:setup
bundle add activeadmin devise draper pundit
rails g active_admin:install
bundle add dartsass-rails
_set `Rails.application.config.dartsass.builds = {'active\_admin.scss': 'active\_admin.css'}` in config/initializers/dartsass.rb_
_add sass: `rails dartsass:watch` to Procfile.dev_

move on to creating the app-specific models with rails g
