require 'terminal-table'
require_relative '../../modules/menus/menu'
require_relative '../../modules/menus/submenu_help'
require_relative '../../modules/menus/submenu_demo'

module MenuHelpers
  # Reference: https://github.com/scarsam/crypto_market/blob/master/lib/crypto_market.rb
  def self.terminal_table(headings = [], *rows, &block)
    Terminal::Table.new :headings => headings.to_a, :rows => rows, &block
  end

  def self.clear
    system('clear')
  end

  def self.validate_input_for_menu_kind(menu_kind)
    MenuHelpers.clear
    puts "== Invalid option chosen. Try again ==\n"
    Menu.show_main_menu
    case menu_kind
      when "main"
        Menu.show_main_menu
      when "sub_help"
        SubmenuHelp.show_sub_menu
      when "sub_demo"
        SubmenuDemo.show_sub_menu
    end
  end

  def self.show_menu_for_menu_kind(menu_kind)
    case menu_kind
      when "main"
        Menu.show_main_menu
      when "sub_help"
        SubmenuHelp.show_sub_menu
      when "sub_demo"
        SubmenuDemo.show_sub_menu
    end
  end

  def self.request_input_continue_for_menu(menu_kind)
    puts "\nPress any key to continue..."
    gets.chomp
    MenuHelpers.show_menu_for_menu_kind(menu_kind)
  end
end