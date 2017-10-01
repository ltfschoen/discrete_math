require_relative '../../../helpers/math/math_helpers'

module PowersDemo

  module LocationConfig
    @@location_coordinates = {
        sydney: { x: -100, y: -100 },
        brisbane: { x: 100, y: 100 },
        melbourne: { x: 200, y: 200 }
    }
  end

  module Calculate
    include LocationConfig # @@location_coordinates

    def self.run
      Calculate.get_distance
    end

    def self.get_distance
      puts "\nCalculating distance from Sydney to Melbourne..."
      location_first = Location.new(@@location_coordinates[:sydney])
      location_second = Location.new(@@location_coordinates[:melbourne])
      route_first = Route.new(location_first, location_second)
      Calculate.show_result(route_first.distance)
    end

    def self.show_result(result)
      puts "=====> Result: #{result}\n"
    end
  end

  class Location
    attr_accessor :coordinates

    def initialize(coordinates)
      @coordinates = coordinates
    end
  end

  class Route
    attr_reader :distance

    def initialize(start_location, finish_location)
      @start_location = start_location
      @finish_location = finish_location
    end

    def distance
      dist_x = @start_location.coordinates[:x] - @finish_location.coordinates[:x]
      dist_y = @start_location.coordinates[:y] - @finish_location.coordinates[:y]
      dist_total = MathHelpers.pythagoras_theorem(dist_x, dist_y)
    end
  end
end