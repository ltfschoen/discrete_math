require_relative '../helpers/math/math_helpers'

# DiscreteMath::Preliminary
module DiscreteMathTopics
  module PreliminaryMath
    module AbsoluteValuesDemo

      module LocationConfig
        @@location_coordinates = {
          sydney: { x: -100, y: -100 },
          brisbane: { x: 100, y: 100 },
          melbourne: { x: 200, y: 200 }
        }
      end

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
