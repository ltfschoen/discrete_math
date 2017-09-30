require 'rake'

namespace :discrete do
  # rake
  task default: %w[run]

  # rake discrete:run[default]
  desc "Run Gem discrete math"
  task :run, [:arg1] do |t, args|
    puts "Running Gem discrete with args #{args.inspect}"
    system("ruby bin/discrete #{args.arg1}")
  end

  # rake discrete:test
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
  desc "Run RSpec tests"
  task :test => :spec

  # rake discrete:uninstall[0.0.1]
  desc "Uninstall Gem discrete math locally"
  task :uninstall, [:old_gem_version] do |t, args|
    puts "Uninstalling Gem discrete with args #{args.inspect}"
    `gem uninstall discrete_math-#{args.old_gem_version}.gem`
    puts "Uninstalled Gem discrete math version: #{args.old_gem_version}"
  end

  # rake discrete:install
  desc "Install Gem discrete math locally from gemspec"
  task :install do
    spec = Gem::Specification::load("discrete_math.gemspec")
    puts "Building and installing Gem from gemspec discrete math with version #{spec.version}"
    `gem build discrete_math.gemspec`
    `gem install discrete_math-#{spec.version}.gem`
    puts "Built and installed Gem discrete math version: #{spec.version}"
  end

  # rake discrete:deploy[0.0.2]
  desc "Deploy latest Gem discrete math version to RubyGems"
  task :deploy, [:new_gem_version] do |t, args|
    spec = Gem::Specification::load("discrete_math.gemspec")
    puts "Deploying Gem discrete math discrete_math-#{spec.version}.gem"
    `gem push discrete_math-#{spec.version}.gem`
    puts "Deployed Gem discrete math version: #{spec.version}"
    `gem list -r discrete_math`
  end
end
