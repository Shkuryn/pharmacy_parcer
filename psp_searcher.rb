# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'selenium-webdriver'
require 'uri'
require 'net/http'
require 'openssl'
require './drug'
require './translate'

# PspSearcher class performs a search for a given drug name on a specified website
# using Selenium and outputs the resulting elements
class PspSearcher
  PHARMACY = 'PSP'
  def initialize(drug_name)
    @drug_name = drug_name
  end

  def save_drug(text)
    array = text.to_s.split
    drug = Drug.new
    drug.title = array[0, 6].join(' ')
    drug.amount_with_discount = array[-3].gsub(' Gel', '').to_f
    drug.pharmacy = PHARMACY
  end

  def search
    url = "https://psp.ge/catalogsearch/result?q=#{@drug_name}"
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to url

    elements = driver.find_elements(:class, 'product')

    elements.each do |element|
      gt = GoogleTranslator.new(element.text)
      gt.translate
      save_drug(gt.text_to)
    end

    driver.quit
  end
end
