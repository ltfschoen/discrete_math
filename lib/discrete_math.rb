require_relative './modules/menus/menu'

module DiscreteMath
  include Menu

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
      Menu.show_choices_main_menu
    else
      Menu.show_choices_main_menu
    end
  end
end
