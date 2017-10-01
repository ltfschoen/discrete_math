require 'rest-client'
require 'digest'

module ShasumDemo
  def self.run
    puts "\nChoose a Gem from RubyGems to validate its the Checksum of its SHA-256"
    puts "- Enter name of Gem (i.e. rails): "
    gem_name = gets.chomp.downcase.strip
    puts "Enter version of Gem (i.e. 5.1.2): "
    gem_version = gets.chomp.strip
    valid_shasum?(gem_name, gem_version)
  end

  def self.is_gem?(gem_name, gem_version)
    puts "Please wait. Checking that given version exists for gem"
    response = %x[gem search '^#{gem_name}$' --all]
    if response != "\n"
      gem_versions_list = response[response.index('(')+1..response.index(')')-1].split(',').map {|ver| ver.strip }
      return (gem_versions_list.include? gem_version) ? true : false
    else
      puts "\nNo versions of the gem exist"
      return false
    end
  end

  def self.get_checksum_for_gem(gem_name, gem_version)
    puts "\nObtaining actual checksum SHA 256 for #{gem_name} gem version #{gem_version}"
    raw = RestClient::Request.execute(
        method: :get,
        url: "https://rubygems.org/downloads/#{gem_name}-#{gem_version}.gem",
        raw_response: true)
    Digest::SHA256.file(raw.file.path).hexdigest
  end

  def self.valid_shasum?(gem_name, gem_version)
    is_gem = is_gem?(gem_name, gem_version)
    return false if not is_gem
    expected_checksum = get_checksum_for_gem(gem_name, gem_version)
    puts "Please wait. Downloading gem into subfolder ./temp"
    %x[mkdir -p temp; cd temp; gem fetch #{gem_name} --version '#{gem_version}';]
    output = %x[cd temp; shasum -a 256 ./#{gem_name}-#{gem_version}.gem]
    actual_checksum = output.split[0] # split on space
    puts "Actual Checksum: #{actual_checksum}"
    puts "Expected Checksum: #{expected_checksum}"
    puts "Valid Checksum: #{actual_checksum == expected_checksum}"
    actual_checksum == expected_checksum
  end
end