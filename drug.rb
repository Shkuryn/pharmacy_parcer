# frozen_string_literal: true

require 'terminal-table'
class Drug < Array
  @@all = []
  attr_accessor :title, :amount, :amount_with_discount, :country, :pharmacy

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end

  def self.display_drugs
    rows = []
    all.each do |drug|
      rows << [drug.title, drug.amount, drug.amount_with_discount, drug.pharmacy]
    end
    table = Terminal::Table.new headings: ['Title', 'Amount', 'Amount with discount', 'Pharmacy'], rows: rows
    puts table
  end
end
