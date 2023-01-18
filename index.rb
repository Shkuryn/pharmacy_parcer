# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'

doc = Nokogiri::HTML(URI.open('https://www.aversi.ge/en/aversi/act/searchMedicine/?kw_en=Adazal'))
product_elements  = doc.css('.product')

product_elements.each do |product|
  product_details = product.at('.product-details').children.map(&:to_html)
  product_details = product_details.reject { |e| e == "\n" }
  product_details.each do |details|
    details_text = Nokogiri::HTML(details)

    product_title = details_text.at_css('.product-title')
    amount = details_text.at_css('.amount')
    amount_with_discount = details_text.css('ins .amount').text.gsub(/[^\d.]/, '')

    country  = details_text.css('div strong')[0]
    puts "title= #{product_title}"
    puts "amount = #{amount}"
    puts "amount_with_discount = #{amount_with_discount}"
    puts country

  end

end

