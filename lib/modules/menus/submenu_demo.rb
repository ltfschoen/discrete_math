require_relative '../../helpers/menus/menu_helpers'
require_relative './menu'
require_relative '../topics/discrete_math_topics'

module SubmenuDemo
  include DiscreteMathTopics::PreliminaryMath

  EXIT_SUB_MENU_OPTIONS = ["0"]

  def self.show_sub_menu
    table = MenuHelpers.terminal_table do |t|
      t.title = 'Select a number'
      t.add_row [0, 'Back to main menu']
      t.add_row [1, 'Demo SHA-256 Checksum']
      t.add_row [2, 'Demo Algorithm']
      t.add_row [3, 'Demo Power']
      t.style = { all_separators: true }
    end
    puts table
    puts ''
  end

  def self.show_choices_sub_menu
    Menu.request_input_for_menu("sub_demo")

    user_input = ""
    while not EXIT_SUB_MENU_OPTIONS.include? user_input
      user_input = gets.chomp
      case user_input
        when "0"
          Menu.show_choices_main_menu
        when "1"
          ShasumDemo.run
          MenuHelpers.request_input_continue_for_menu("sub_demo")
          SubmenuDemo.show_choices_sub_menu
        when "2"
          AlgorithmDemo.run
          MenuHelpers.request_input_continue_for_menu("sub_demo")
          SubmenuDemo.show_choices_sub_menu
        when "3"
          PowersDemo::Calculate.run
          MenuHelpers.request_input_continue_for_menu("sub_demo")
          SubmenuDemo.show_choices_sub_menu
        else
          MenuHelpers.validate_input_for_menu_kind("sub_demo")
          SubmenuDemo.show_choices_sub_menu
      end
    end
  end
end