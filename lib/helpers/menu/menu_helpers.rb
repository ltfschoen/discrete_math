require 'terminal-table'

module MenuHelpers
  # Reference: https://github.com/scarsam/crypto_market/blob/master/lib/crypto_market.rb
  def self.terminal_table(headings = [], *rows, &block)
    Terminal::Table.new :headings => headings.to_a, :rows => rows, &block
  end
end