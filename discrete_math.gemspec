Gem::Specification.new do |s|
  s.name        = 'discrete_math'
  s.version     = '0.0.12'
  s.date        = '2017-10-07'
  s.summary     = "Discrete Math"
  s.description = "A discrete math interactive terminal app with sub-menus and demos including a RubyGems checksum validator and Big-O benchmarks using a spinner with threads"
  s.authors     = ["Luke Schoen", "Ruegen Aschenbrenner"]
  s.email       = 'ltfschoen@gmail.com'
  s.required_ruby_version = Gem::Requirement.new(">= 2.1.0")
  s.required_rubygems_version = Gem::Requirement.new(">= 2.2.0")
  # Gemspec Dependencies http://guides.rubygems.org/patterns/
  s.add_runtime_dependency 'rake', '~> 12.1', '>= 12.1.0'
  s.add_runtime_dependency 'terminal-table', '~> 1.8', '>= 1.8.0'
  s.add_runtime_dependency 'rest-client', '~> 2.0', '>= 2.0.2'
  s.add_runtime_dependency 'algorithms', '~> 0.6', '>= 0.6.1'
  s.add_runtime_dependency 'faker', '~> 0.8', '>= 0.8.6'
  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'
  # Self-signing Certificates http://guides.rubygems.org/security/
  s.cert_chain  = ['certs/ltfschoen.pem']
  s.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/
  # http://guides.rubygems.org/specification-reference/#files
  s.files       = ['lib/discrete_math.rb']
  s.files       += Dir['lib/*.rb']
  s.files       += Dir['lib/modules/**/*']
  s.files       += Dir['lib/helpers/**/*']
  s.files       += Dir['lib/utils/**/*']
  s.executables << 'discrete'
  s.homepage    =
    'https://github.com/ltfschoen/discrete_math'
  s.license       = 'MIT'
end
