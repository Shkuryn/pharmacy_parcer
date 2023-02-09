# frozen_string_literal: true

require 'open-uri'
require 'nokogiri'
require 'uri'
require 'net/http'
require 'openssl'
require './drug'
require './psp_searcher'
require './aversi_searcher'

if __FILE__ == $PROGRAM_NAME
  if ARGV.count < 1
    puts 'please run program with param'
    return
  else
    drug = ARGV[0]
  end
  AversiSearcher.new(drug).search
  PspSearcher.new(drug).search
  Drug.display_drugs
end
