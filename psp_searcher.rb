# frozen_string_literal: true

require 'ferrum'
require './drug'
require './translate'

# PspSearcher class performs a search for a given drug name on a specified website
# using Selenium and outputs the resulting elements
class PspSearcher
  PHARMACY = 'PSP'
  attr_reader :drug_name

  def initialize(drug_name)
    @drug_name = drug_name
  end

  def save_drug(text)
    array = text.to_s.split
    title = array[0, 5].join(' ')
    amount = array[-3].gsub(' Gel', '').to_f
    return if amount.zero?

    drug = Drug.new
    drug.title = title
    drug.amount_with_discount = amount
    drug.pharmacy = PHARMACY
    drug
  end

  def search
    url = "https://psp.ge/catalogsearch/result?q=#{drug_name}"
    browser = Ferrum::Browser.new(headless: true)

    browser.goto(url)

    elements = browser.css('.product')

    elements.each do |element|
      gt = GoogleTranslator.new(element.text)
      gt.translate
      save_drug(gt.text_to)
    end

    browser.quit
  end
end
