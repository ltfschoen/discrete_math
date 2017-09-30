Gem::Specification.new do |s|
  s.name        = 'discrete_math'
  s.version     = '0.0.5'
  s.date        = '2017-09-30'
  s.summary     = "Discrete Math"
  s.description = "A discrete math gem"
  s.authors     = ["Luke Schoen", "Ruegen Aschenbrenner"]
  s.email       = 'ltfschoen@gmail.com'
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
