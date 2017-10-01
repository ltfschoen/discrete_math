* Gem End-User Usage
  * Install [Ruby](https://www.ruby-lang.org/en/documentation/installation/)
  * Install using Bundler with Ruby or framework (i.e. Ruby on Rails)
    * Add to Gemfile `gem 'discrete_math'`
    * Install dependencies `bundle install`
  * Install Signed Gem from Ruby Gemspec
    * Download [discrete math Gem](https://rubygems.org/gems/discrete_math)
    * Verify SHA256 Checksum matches
      ```
      ruby -rdigest/sha2 -e "puts Digest::SHA256.new.hexdigest(File.read('discrete_math-<insert_version>.gem'));
      gem install discrete_math --trust-policy HighSecurity
      ```
    * Discrete Math Gem is cryptographically signed to ensure the downloaded gem has not been tampered with. Add my public key (if you haven’t already) as a trusted certificate. The HighSecurity trust profile will verify and only allow the installation of signed gem dependencies.
      ```
      gem cert --add <(curl -Ls https://raw.github.com/ltfschoen/discrete_math/master/certs/ltfschoen.pem)
      gem install metric_fu -P HighSecurity
      ```

  * Run in Interactive Ruby (IRB)
    * Run IRB `irb`
    * Load and Run Gem discrete math within IRB `require 'discrete_math'; DiscreteMath.run("default")`
    * Exit IRB `quit`

* Gem Developer Contributor Usage
  * Clone Repo `git clone https://github.com/ltfschoen/discrete_math && cd discrete_math`
  * Setup
    * Switch to Ruby version `rbenv use 2.4.2`
    * Install dependencies `gem install rspec; bundle install`
    * Show Gem environment and installation locations `gem env home; gem list -d`
    * Show Rake commands available `rake -T`
  * Unit Tests
    * Run Unit Tests `rake discrete:test`
      * Alternative `rspec spec/helpers/math_helpers_spec.rb`
  * Build, install, and run Gem updates on local machine
    * Change version in discrete_math.gemspec
    * Note: [Check that all used Gem files have been added to Gemspec](http://guides.rubygems.org/specification-reference/#files)
    * Uninstall specific version of previously installed discrete math gem (i.e. version 0.0.1) `rake discrete:uninstall[0.0.1]`
    * Build and install new discrete math gem version defined in discrete_math.gemspec `rake discrete:install`
    * Run
      * Default program passing argument for default mode `rake discrete:run[default]`
        * Alternative 2: See IRB instructions for General User
  * Deploy latest Gem discrete math version to RubyGems (i.e. version 0.0.2) `rake discrete:deploy[0.0.2]`

* Gem Construction Info
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

* References
  * [Create Ruby Gem](http://guides.rubygems.org/make-your-own-gem/)
  * [RSpec Tests](http://rspec.info/)
  * Rake
    * Executable and ARGV
      * [Rake Executable and ARGV](http://www.thegreatcodeadventure.com/argv-and-command-line-gems/)
      * [ARGV](https://github.com/rails/rails/blob/master/railties/lib/rails/commands.rb)
    * [Rake Task Guide](http://www.stuartellis.name/articles/rake/)
      * [Rakefile Bash Commands](https://stackoverflow.com/questions/9796028/execute-bash-commands-from-a-rakefile)
