module ShasumDemo
  def self.run
    get_shasum_256
  end

  def self.get_shasum_256
    puts "\nCalculating Checksum SHA 256 for discrete math gem 0.0.1"
    puts "- Downloading discrete math gem 0.0.1 into current direcory"
    puts "- Please wait..."
    %x[gem fetch discrete_math --version '0.0.1']
    output = %x[shasum -a 256 ./discrete_math-0.0.1.gem]
    actual_checksum = output.split[0] # split on space
    expected_checksum = "6606cf0c00342de2955e5c7af7bb36daf8546df2895093ac8070618530f3748b"
    puts "Actual Checksum: " + actual_checksum
    puts "Expected Checksum: #{expected_checksum}"
    puts "Valid Checksum: #{actual_checksum == expected_checksum}"
    actual_checksum
  end
end