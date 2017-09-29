require_relative './modules/discrete_math_topics'

module DiscreteMath
  include DiscreteMathTopics::PreliminaryMath # AbsoluteValuesDemo
  include DiscreteMathTopics::PreliminaryMath::AbsoluteValuesDemo::LocationConfig # @@location_coordinates

  def self.demo_power_of
    location_first = AbsoluteValuesDemo::Location.new(@@location_coordinates[:sydney])
    location_second = AbsoluteValuesDemo::Location.new(@@location_coordinates[:melbourne])
    route_first = AbsoluteValuesDemo::Route.new(location_first, location_second)
    puts "=====> Demo Power Of: route first distance is: #{route_first.distance}"
  end
end

module Menu
  include DiscreteMathTopics::PreliminaryMath::AbsoluteValuesDemo::LocationConfig # @@location_coordinates

  USER_OPTIONS = {
    "1": :demo_power_of
  }

  def self.request_user_choice_demo
    user_choice = ""
    while not USER_OPTIONS.keys.include? user_choice.to_i
      system('clear')
      if user_choice == "invalid"
        puts "== Invalid option chosen. Try again ==\n"
      end
      puts """
      Select demo number to run or 'q' to quit:\n
      1) Demo power of
      """
      user_choice = gets.chomp
      if user_choice == "1"
        DiscreteMath.demo_power_of
        break
      elsif user_choice == "q"
        break
      else
        user_choice = "invalid"
      end
    end
  end
end

Menu.request_user_choice_demo
