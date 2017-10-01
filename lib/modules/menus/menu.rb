require_relative '../../helpers/menus/menu_helpers'
require_relative './submenu_help'
require_relative './submenu_demo'

module Menu
  EXIT_MAIN_MENU_OPTIONS = ["3"]

  def self.show_greeting
    puts "Welcome to Discrete Math Demo\nEnter a number to navigate"
  end

  def self.exit
    puts "\nThank you for trying Discrete Math Demo"
    Kernel.exit(false)
  end

  def self.request_input_for_menu(menu_kind)
    MenuHelpers.clear
    MenuHelpers.show_menu_for_menu_kind(menu_kind)
    puts 'Enter a number: '
  end

  def self.show_main_menu
    table = MenuHelpers.terminal_table do |t|
      t.title = Menu.show_greeting
      t.add_row [1, 'Demos']
      t.add_row [2, 'Help']
      t.add_row [3, 'Exit']
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
          SubmenuDemo.show_choices_sub_menu
        when "2"
          SubmenuHelp.show_choices_sub_menu
        when "3"
          Menu.exit
        else
          MenuHelpers.validate_input_for_menu_kind("main")
          Menu.show_choices_main_menu
      end
    end
  end
end