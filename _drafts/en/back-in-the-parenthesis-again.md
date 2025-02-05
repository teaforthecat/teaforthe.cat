# Steps


# Updating


before update, here is the current state
```sh
λ which clojure
/usr/local/bin/clojure
λ which clj
/usr/local/bin/clj
λ clj --version
Clojure CLI version 1.10.3.986
```


```
brew update clojure/tools/clojure
error already installed


```

that reminds me, what version of Java do I have?

```sh
λ which java
/Users/cthompson/.jenv/shims/java
λ java -version
openjdk version "1.8.0-internal"
OpenJDK Runtime Environment (build 1.8.0-internal-jenkins_2017_07_27_21_17-b00)
OpenJDK 64-Bit Server VM (build 25.71-b00, mixed mode)
```

ok, wut, oh jenv, right I forgot about that. jenv won't install java like other "*env" managers, but since java already supports multiple installs using version in directories and an an environment variable, going ahead and installing a new version from brew shouldn't be to incidious.

```sh
λ brew install --cask temurin@21
```

ok wut, I got a .pkg and nothing else happened, so, let's not do that, back away slowly.
oh wait instead of adding to the shell PATH, we need to add the newly installed java home to jenv, 

```sh
jenv add /Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home
openjdk64-21.0.3 added
21.0.3 added
21.0 added
 jenv shell 21.0
λ java -version
openjdk version "21.0.3" 2024-04-16 LTS
OpenJDK Runtime Environment Temurin-21.0.3+9 (build 21.0.3+9-LTS)
OpenJDK 64-Bit Server VM Temurin-21.0.3+9 (build 21.0.3+9-LTS, mixed mode)
```
yay!


now for the nerve inducing bit
```sh
To install 1.11.3.1463, first run:
  brew unlink clojure
λ brew unlink clojure
Unlinking /usr/local/Cellar/clojure/1.10.3.986... 4 symlinks removed.
λ brew install clojure/tools/clojure
λ clojure -version
Clojure CLI version 1.11.3.1463
λ clj -version
Clojure CLI version 1.11.3.1463
```

yay!



Ok now back to this app template
```sh
Execution error (FileNotFoundException) at java.io.FileInputStream/open0 (FileInputStream.java:-2).
zsh: command not found: -Sdeps
```

ah dang, wut? oh "make sure Clojure _and_ deps-new are installed" ok


```sh
as stated: clojure -Ttools install-latest :lib io.github.seancorfield/deps-new :as new
succeeded
```

but that is a zsh error, not a Clojure error, so maybe the copy paste is not working


nope, actually I think that is a java error, maybe I shouldn't have updated java after all?

umm... I just deleted the S in -Sdeps and retyped the S, and now it worked, so, ohmywut, maybe an invisible character got int there somehow ? idk but I'm moving on->

```sh
 λ clj -Sdeps '{:deps {io.github.kees-/re-marfer {:git/tag "0.1.0" :git/sha "7e42a3a"}}}' -Tnew create :template kees/re-marfer :name teaforthecat/player
Cloning: https://github.com/kees-/re-marfer.git
...
Creating project from kees/re-marfer in player
λ cd player 
λ npm install

added 112 packages, and audited 113 packages in 5s

16 packages are looking for funding
  run `npm fund` for details

found 0 vulnerabilities
```
 

```emacs-lisp
jack-in
wait
answer shadow, then browser repl
and vola!
```

eval buffer and see "dev mode" and we are off to the races

oh wait where am I? why do I where is the html?

Oh I think I want app, not browser repl


