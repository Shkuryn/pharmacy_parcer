# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'selenium-webdriver'
require 'uri'
require 'net/http'
require 'openssl'
require './drug'
require './psp_searcher'
require './aversi_searcher'

def display_drugs
  Drug.all.each do |drug|
    puts "Title: #{drug.title}"
    puts "Amount: #{drug.amount}"
    puts "Amount with discount: #{drug.amount_with_discount}"
    puts "Pharmacy: #{drug.pharmacy}"
  end
end

if __FILE__ == $PROGRAM_NAME
  if ARGV.count < 1
    puts 'please run program with param'
    return
  else
    drug = ARGV[0]
  end
  AversiSearcher.new(drug).search
  PspSearcher.new(drug).search
  display_drugs
end

