require 'rake'

namespace :discrete do
  # rake
  task default: %w[run]

  # rake discrete:run
  desc "Run Gem discrete math"
  task :run do
    ruby "bin/discrete"
  end

  # rake discrete:test
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  desc "Run RSpec tests"
  task :test => :spec

  # rake discrete:gem[0.0.1,0.0.2]
  desc "Build and install Gem discrete math locally"
  task :gem, [:old_gem_version, :new_gem_version] do |t, args|
    puts "Building Gem discrete with args #{args.inspect}"
    `gem uninstall discrete_math-#{args.old_gem_version}.gem`
    `gem build discrete_math.gemspec`
    `gem install discrete_math-#{args.new_gem_version}.gem`
    puts "Built and installed Gem discrete math version: #{args.new_gem_version}"
  end
end
