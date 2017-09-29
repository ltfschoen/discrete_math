Gem::Specification.new do |s|
  s.name        = 'discrete_math'
  s.version     = '0.0.1'
  s.date        = '2017-09-29'
  s.summary     = "Discrete Math"
  s.description = "A discrete math gem"
  s.authors     = ["Luke Schoen"]
  s.email       = 'luke.schoen@coderacademy.edu.au'
  # http://guides.rubygems.org/specification-reference/#files
  s.files       = ['lib/discrete_math.rb']
  s.files       += Dir['lib/*.rb']
  s.files       += Dir['lib/modules/**/*']
  s.files       += Dir['lib/helpers/**/*']
  s.homepage    =
    'http://rubygems.org/gems/discrete_math'
  s.license       = 'MIT'
end
