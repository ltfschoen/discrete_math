require_relative 'discrete_maths'

def demo_power_of
  location_coordinates = {
    sydney: { x: -100, y: -100 },
    brisbane: { x: 100, y: 100 },
    melbourne: { x: 200, y: 200 }
  }
  location_first = DiscreteMath::PreliminaryMath::AbsoluteValuesDemo::Location.new(location_coordinates[:sydney])
  location_second = DiscreteMath::PreliminaryMath::AbsoluteValuesDemo::Location.new(location_coordinates[:melbourne])
  route_first = DiscreteMath::PreliminaryMath::AbsoluteValuesDemo::Route.new(location_first, location_second)
  puts "- Demo Power Of: route first distance is: #{route_first.distance}"
end

demo_power_of
