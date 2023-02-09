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

  def save_drug(title, amount)
    return if amount.zero?

    drug = Drug.new
    drug.title = title
    drug.amount_with_discount = amount
    drug.pharmacy = PHARMACY
    drug
  end

  def search
    success = true
    browser = Ferrum::Browser.new(headless: true)
    page_number = 0

    while success do
      page_number += 1
      url = "https://psp.ge/catalogsearch/result?q=#{drug_name}&page=#{page_number}"
      browser.goto(url)
      html_doc = Nokogiri::HTML(browser.body)
      elements = html_doc.css('.product')

      counter = 1
      elements.each do |element|
        title = element.xpath("//*[@id='app']/div[1]/div/div/div/div[3]/div[2]/div[#{counter}]/a/div[2]").inner_text
        price = element.xpath("//*[@id='app']/div[1]/div/div/div/div[3]/div[2]/div[#{counter}]/a/div[3]/div[1]")
        .inner_text.gsub('₾ ', '').to_f

        gt = GoogleTranslator.new(title)
        gt.translate
        save_drug(gt.text_to, price)
        counter += 1
      end
      success = false if elements.count < 20
    end

    browser.quit
  end
end
