require_relative './modules/discrete_math_topics'
require_relative './helpers/menu/menu_helpers'

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

    EXIT_MAIN_MENU_OPTIONS = ["3"]
    EXIT_SUB_MENU_OPTIONS = ["2"]

    def self.show_greeting
      puts "Welcome to Discrete Math Demo\nEnter a number to navigate"
    end

    def self.exit
      puts "\nThank you for trying Discrete Math Demo"
      Kernel.exit(false)
    end

    def self.clear
      system('clear')
    end

    def self.validate_input
      Menu.clear
      puts "== Invalid option chosen. Try again ==\n"
      Menu.show_main_menu
    end

    def self.request_input_for_menu(menu_kind)
      Menu.clear
      Menu.show_menu_for_menu_kind(menu_kind)
      puts 'Enter a number: '
    end

    def self.request_input_continue_for_menu(menu_kind)
      puts "\nPress any key to continue..."
      gets.chomp
      Menu.show_menu_for_menu_kind(menu_kind)
    end

    def self.show_menu_for_menu_kind(menu_kind)
      case menu_kind
        when "main"
          Menu.show_main_menu
        when "sub"
          Menu.show_sub_menu
      end
    end

    def self.show_main_menu
      table = MenuHelpers.terminal_table do |t|
        t.title = Menu.show_greeting
        t.add_row [1, 'Demo of Powers']
        t.add_row [2, 'Help']
        t.add_row [3, 'Exit']
        t.style = { all_separators: true }
      end
      puts table
      puts ''
    end

    def self.show_sub_menu
      table = MenuHelpers.terminal_table do |t|
        t.title = 'Select a number'
        t.add_row [1, 'Symbols']
        t.add_row [2, 'Return to main menu']
        t.style = { all_separators: true }
      end
      puts table
      puts ''
    end

    def self.show_choices_main_menu
      Menu.request_input_for_menu("main")

      user_input = ""
      while not EXIT_MAIN_MENU_OPTIONS.include? user_input
        user_input = gets.chomp
        case user_input
          when "1"
            puts "\nCalculating distance from Sydney to Melbourne..."
            route_first = DiscreteMath::Power.get_distance
            Menu.show_result(route_first.distance)
            Menu.request_input_continue_for_menu("main")
            Menu.show_choices_main_menu
          when "2"
            Menu.show_choices_sub_menu
          when "3"
            Menu.exit
          else
            Menu.validate_input
            Menu.show_choices_main_menu
        end
      end
    end

    def self.show_choices_sub_menu
      Menu.request_input_for_menu("sub")

      user_input = ""
      while not EXIT_MAIN_MENU_OPTIONS.include? user_input
        user_input = gets.chomp
        case user_input
          when "1"
            puts "Sub-set - ⊆"
            Menu.request_input_continue_for_menu("sub")
            Menu.show_choices_sub_menu
          when "2"
            Menu.show_choices_main_menu
          else
            Menu.validate_input
            Menu.show_choices_sub_menu
        end
      end
    end

    def self.show_result(result)
      puts "=====> Demo Power Of result is: #{result}\n"
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
      DiscreteMath::Menu.show_choices_main_menu
    else
      DiscreteMath::Menu.show_choices_main_menu
    end
  end
end

# DiscreteMath.run("d")