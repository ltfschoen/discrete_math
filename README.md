Travis CI Build Status: [![Build Status](https://api.travis-ci.org/ltfschoen/discrete_math.svg)](https://travis-ci.org/ltfschoen/discrete_math)

* Gem End-User Usage
  * Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
  * Install using Bundler with Ruby or framework (i.e. Ruby on Rails)
    * Add to Gemfile `gem 'discrete_math'`
    * Install dependencies `bundle install`
    * Add missing dependencies
      ```
      gem install rest-client
      ```
  * Setup IntelliJ
    * Fix error `TERM environment variable not set`
      * Add to Edit Configurations Environment Variable `TERM=xterm-256color`
  * Install Signed Gem from Ruby Gemspec
    * Download [discrete math Gem](https://rubygems.org/gems/discrete_math)
    * Verify SHA256 Checksum matches
      ```
      ruby -rdigest/sha2 -e "puts Digest::SHA256.new.hexdigest(File.read('discrete_math-<insert_version>.gem'));
      gem install discrete_math --trust-policy MediumSecurity
      ```
    * Discrete Math Gem is cryptographically signed to ensure the downloaded gem has not been tampered with. Add my public key (if you haven’t already) as a trusted certificate. The MediumSecurity trust profile verifies signed gems but allows installation of required unsigned dependencies.
      ```
      gem cert --add <(curl -Ls https://raw.github.com/ltfschoen/discrete_math/master/certs/ltfschoen.pem)
      gem install discrete_math -P MediumSecurity
      ```
  * Run in Interactive Ruby (IRB)
    * Run IRB
    * Load and Run Gem discrete math within IRB
    * Exit IRB `quit`
    * Summary of Steps
      ```
      irb
      require 'discrete_math'; DiscreteMath.run("default")
      ```

* Gem Developer Contributor Usage
  * Clone Repo
    ```
    git clone https://github.com/ltfschoen/discrete_math && cd discrete_math
    ```
  * Setup
    * Switch to Ruby version
    * [Install Gemspec dependencies](http://guides.rubygems.org/patterns/)
    * Show Gem environment and installation locations
    * Show Rake commands available
    * Summary of Setup Steps
      ```
      rbenv local 2.4.2;
      gem install --dev rake terminal-table rake rest-client rspec algorithms;
      gem env home; gem list -d;
      rake -T;
      ```
    * Run Demo
      ```
      ruby main.rb
      ```
  * Unit Tests
    * Run Automatic Unit Tests `bundle exec guard`
      * Alternative 1: `rake`
      * Alternative 2: `rake discrete:test`
      * Alternative 3: `rspec spec/helpers/math_helpers_spec.rb`
    * Guard Setup
      * Add to Gemfile
        ```
        source 'https://rubygems.org'

        group :development do
          gem 'rspec', '~> 3.6.0'
          gem 'guard-rspec', '~> 4.7.3'
        end
        ```
      * Install dependencies `bundle install`
      * Generate Guardfile `bundle exec guard init rspec`
      * Remove Rails sections from Guardfile
      * Run Guard `bundle exec guard`
      * Watch Guard automatically run tests after each codebase change
  * Build, install, and run Gem updates on local machine
    * Change version in discrete_math.gemspec
    * Note: [Check that all used Gem files have been added to Gemspec](http://guides.rubygems.org/specification-reference/#files)
    * Create Self-Signed Gem Certificate
      * Update discrete_math.gemspec
        ```
        s.cert_chain  = ['certs/ltfschoen.pem']
        s.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/
        ```
      * Generate Certificates
        ```
        ~/.ssh/gem cert --build ltfschoen@gmail.com
        ~/.ssh/chmod 600 gem-p*
        mkdir certs; cp ~/.ssh/gem-public_cert.pem certs/ltfschoen.pem
        git add certs/ltfschoen.pem
        gem cert --add certs/ltfschoen.pem
        ```
    * Reference
      * [RubyGem Security](http://guides.rubygems.org/security/)
    * Uninstall specific version of previously installed discrete math gem (i.e. version 0.0.1) `rake discrete:uninstall[0.0.1]`
    * Build and install new discrete math gem version defined in discrete_math.gemspec `rake discrete:install`
    * Run
      * Default program passing argument for default mode `rake discrete:run[default]`
        * Alternative 2: See IRB instructions for General User
  * Deploy latest Gem discrete math version to RubyGems (i.e. version 0.0.2) `rake discrete:deploy[0.0.2]`
  * Deployment Steps Summary
    ```
    rake discrete:install;
    cd ~/.ssh/; gem cert --build ltfschoen@gmail.com; chmod 600 gem-p*;
    cd ~/code/discrete_maths;
    mkdir -p certs; cp ~/.ssh/gem-public_cert.pem certs/ltfschoen.pem;
    gem cert --add certs/ltfschoen.pem; git add certs/ltfschoen.pem;
    rake discrete:deploy[0.0.8]
    ```

* References
  * [Create Ruby Gem](http://guides.rubygems.org/make-your-own-gem/)
  * [RSpec Tests](http://rspec.info/)
  * Rake
    * Executable and ARGV
      * [Rake Executable and ARGV](http://www.thegreatcodeadventure.com/argv-and-command-line-gems/)
      * [ARGV](https://github.com/rails/rails/blob/master/railties/lib/rails/commands.rb)
    * [Rake Task Guide](http://www.stuartellis.name/articles/rake/)
      * [Rakefile Bash Commands](https://stackoverflow.com/questions/9796028/execute-bash-commands-from-a-rakefile)
