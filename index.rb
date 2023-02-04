# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'selenium-webdriver'
require 'uri'
require 'net/http'
require 'openssl'
require './drug'
require './psp_searcher'

# def aversi_search
#   doc = Nokogiri::HTML(URI.open('https://www.aversi.ge/en/aversi/act/searchMedicine/?kw_en=Adazal'))
#   product_elements = doc.css('.product')
#
#   product_elements.each do |product|
#     product_details = product.at('.product-details').children.map(&:to_html)
#     product_details = product_details.reject { |e| e == "\n" }
#     product_details.each do |details|
#       details_text = Nokogiri::HTML(details)
#
#       product_title = details_text.at_css('.product-title')
#       amount = details_text.at_css('.amount')
#       amount_with_discount = details_text.css('ins .amount').text.gsub(/[^\d.]/, '')
#
#       country  = details_text.css('div strong')[0]
#       puts "title= #{product_title}"
#       puts "amount = #{amount}"
#       puts "amount_with_discount = #{amount_with_discount}"
#       puts country
#
#     end
#
#   end
#
# end

#
# def psp_search
#
#   # Fetch the HTML document
#   url = 'https://psp.ge/catalogsearch/result?q=Solgar'
#   # html_doc = Nokogiri::HTML(open(url))
#
#   # Create a new Selenium driver
#   driver = Selenium::WebDriver.for :chrome
#   driver.navigate.to url
#   element = driver.find_element(:tag_name, 'header')
#   driver.action.context_click(element).perform
#
#   # Locate all elements within the context menu
#   # context_menu_items = driver.find_elements(:css, "ul[role='menu'] li")
#   context_menu_items = driver.find_elements(:class, "context-menu")
#
#   # Retrieve the text of each context menu item
#   context_menu_items.each do |item|
#     puts item.text
#   end
#
#
#   sleep 10
#   # Locate the 'Translate to' option
#   # translate_to_option = driver.find_element(:xpath, "//*[text()='Translate to english']")
#   #
#   # # Click the 'Translate to' option
#   # driver.action.click(translate_to_option).perform
#
#
#   # elements = driver.find_elements(:class, 'product')
#   #
#   # # Print the element's text
#   # elements.each do |element|
#   #   # Print the element's text
#   #   puts element.text
#   # end
#
#   # Close the browser
#   # driver.quit
# end

# aversi_search
# psp_search
drug = 'Solgar'
PspSearcher.new(drug).search
