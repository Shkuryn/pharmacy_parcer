# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'selenium-webdriver'
require 'uri'
require 'net/http'
require 'openssl'
require './drug'

class AversiSearcher
  PHARMACY = 'Aversi'
  def initialize(drug_name)
    @drug_name = drug_name
  end

  def save_drug(details_text)
    doc = Nokogiri::HTML(details_text)
    title = doc.at_css('.product-title')
    return if title.nil?

    drug = Drug.new
    drug.title = title.content
    drug.amount = doc.at_css('.amount').content
    drug.amount_with_discount = doc.css('ins .amount').text.gsub(/[^\d.]/, '')
    drug.country = doc.css('div strong')[0].content
    drug.pharmacy = PHARMACY
  end

  def search
    doc = Nokogiri::HTML(URI.open("https://www.aversi.ge/en/aversi/act/searchMedicine/?kw_en=#{@drug_name}"))
    product_elements = doc.css('.product')

    product_elements.each do |product|
      product_details = product.at('.product-details').children.map(&:to_html)
      product_details = product_details.reject { |e| e == "\n" }
      product_details.each do |details|
        details_text = Nokogiri::HTML(details).to_html
        save_drug(details_text)
      end
    end
  end
end
