# frozen_string_literal: true

require 'terminal-table'

class Drug < Array
  attr_accessor :title, :amount_with_discount, :pharmacy

  def self.all
    @all ||= []
  end

  def initialize
    super
    self.class.all << self
  end

  def self.first
    all.first
  end

  def self.last
    all.last
  end

  def self.count
    all.count
  end

  def self.display_drugs
    rows = []
    all.sort_by!(&:amount_with_discount)
    all.each do |drug|
      rows << [drug.title, drug.amount_with_discount, drug.pharmacy]
    end
    table = Terminal::Table.new headings: ['Title', 'Amount with discount', 'Pharmacy'], rows: rows
    puts table
  end
end
