Gem::Specification.new do |s|
  s.name        = 'discrete_math'
  s.version     = '0.0.9'
  s.date        = '2017-10-02'
  s.summary     = "Discrete Math"
  s.description = "A discrete math gem"
  s.authors     = ["Luke Schoen", "Ruegen Aschenbrenner"]
  s.email       = 'ltfschoen@gmail.com'
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3")
  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.2")
  # Self-signing Certificates http://guides.rubygems.org/security/
  s.cert_chain  = ['certs/ltfschoen.pem']
  s.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/
  # http://guides.rubygems.org/specification-reference/#files
  s.files       = ['lib/discrete_math.rb']
  s.files       += Dir['lib/*.rb']
  s.files       += Dir['lib/modules/**/*']
  s.files       += Dir['lib/helpers/**/*']
  s.executables << 'discrete'
  s.homepage    =
    'https://github.com/ltfschoen/discrete_math'
  s.license       = 'MIT'
end
