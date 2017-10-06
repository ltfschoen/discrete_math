module Utils
  class Spinner

    def initialize
      @wheel = ''
      @processing = false
    end

    def start_processing
      @wheel = %w{| / - \\}
      @processing = true
      while @processing do
        print "\b" + @wheel.rotate!.first
        sleep(0.1)
      end
    end

    def self.all
      ObjectSpace.each_object(self).to_a
    end

    def is_processing?
      @processing
    end

    def stop_processing
      @wheel = ''
      @processing = false
    end
  end
end
