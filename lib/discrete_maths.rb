require_relative './helpers/math/math_helpers'

# DiscreteMath::Preliminary
module DiscreteMath
  module PreliminaryMath
    module AbsoluteValuesDemo
      class Location
        attr_accessor :coordinates

        def initialize(coordinates)
          @coordinates = coordinates
        end
      end

      class Route
        attr_accessor :distance

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
  end
end
