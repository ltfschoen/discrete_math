* Setup
  * Install dependencies
    ```
    gem install rspec
    bundle install
    ```
  * Run
    ```
    ruby lib/discrete_math.rb
    ```

* Executable
  ```
  rake -T
  rake discrete:start
  ruby bin/discrete
  ```

* Unit Tests
  ```
  rake discrete:test
  rspec spec/helpers/math_helpers_spec.rb
  ```

* Gem Setup
  ```
  rbenv use 2.4.2
  gem env home
  gem list -d
  gem uninstall discrete_math-0.0.1.gem
  gem build discrete_math.gemspec
  gem install discrete_math-0.0.1.gem
  irb
  require 'discrete_math'
  1
  quit
  curl -u qrush https://rubygems.org/api/v1/api_key.yaml > ~/.gem/credentials; chmod 0600 ~/.gem/credentials
  gem push discrete_math-0.0.1.gem
  gem list -r discrete_math
  ```
  * Note: [Check all Gem files added to Gemspec](http://guides.rubygems.org/specification-reference/#files)

* Tools
  * [Create Ruby Gem](http://guides.rubygems.org/make-your-own-gem/)
  * [RSpec Tests](http://rspec.info/)
  * Rake
    * http://www.thegreatcodeadventure.com/argv-and-command-line-gems/
    * https://stackoverflow.com/questions/9796028/execute-bash-commands-from-a-rakefile
    * http://www.stuartellis.name/articles/rake/
