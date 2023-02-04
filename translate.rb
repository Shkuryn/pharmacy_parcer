# frozen_string_literal: true

require 'google/cloud/translate/v2'
require 'dotenv'
Dotenv.load('./.env')

API_KEY = ENV['API_KEY']
translate = Google::Cloud::Translate::V2.new(
  key: API_KEY
)
text = 'გამარჯობა'
translation = translate.translate text, to: 'ru'
puts translation.text

