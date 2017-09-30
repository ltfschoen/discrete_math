require_relative './modules/discrete_math_topics'

module DiscreteMath
  module Power
    include DiscreteMathTopics::PreliminaryMath # AbsoluteValuesDemo
    include DiscreteMathTopics::PreliminaryMath::AbsoluteValuesDemo::LocationConfig # @@location_coordinates

    def self.get_distance
      location_first = AbsoluteValuesDemo::Location.new(@@location_coordinates[:sydney])
      location_second = AbsoluteValuesDemo::Location.new(@@location_coordinates[:melbourne])
      route_first = AbsoluteValuesDemo::Route.new(location_first, location_second)
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
        # system('clear')
        if user_choice == "invalid"
          puts "== Invalid option chosen. Try again ==\n"
        end
        puts """
        Select demo number to run or 'q' to quit:\n
        1) Demo power of
        """
        user_choice = gets.chomp
        if user_choice == "1"
          puts "Calculating distance from Sydney to Melbourne..."
          route_first = DiscreteMath::Power.get_distance
          Menu.show_result(route_first.distance)
          break
        elsif user_choice == "q"
          break
        else
          user_choice = "invalid"
        end
      end
    end

    def self.show_result(result)
      puts "=====> Demo Power Of result is: #{result}"
    end
  end

  def self.run(arg)
    ARGV << '--help' if ARGV.empty? and not arg

    aliases = {
      "d"  => "default"
    }

    command = ARGV.shift || arg
    command = aliases[command] || command
    case command
    # i.e. require 'discrete_math'; DiscreteMath.run(nil)
    when "--help"
      puts "Gem General User Usage: Try running within IRB: `require 'discrete_math'; DiscreteMath.run('default')`"
      puts "Gem Developer Contributor Usage: Try running 'rake discrete:run[d]' or 'ruby bin/discrete d'"
    # i.e. require 'discrete_math'; DiscreteMath.run("d")
    when "d", "default"
      DiscreteMath::Menu.request_user_choice_demo
    else
      DiscreteMath::Menu.request_user_choice_demo
    end
  end
end
