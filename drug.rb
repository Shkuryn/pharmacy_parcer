# frozen_string_literal: true

class Drug < Array
  @@all = []
  attr_accessor :title, :amount, :amount_with_discount, :country, :pharmacy

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end
