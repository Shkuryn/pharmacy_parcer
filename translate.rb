# frozen_string_literal: true

require 'google/cloud/translate/v2'
require 'dotenv'
Dotenv.load('.env')

# GoogleTranslator is a Ruby class for translating text using Google Cloud Translate API.
#
#   Class Variables
#  API_KEY - The API key for accessing Google Cloud Translate API. The value should be set from the ENV variable.
#    Attributes
# text_from - The text to be translated. It is initialized when a new instance of the class is created.
# text_to - The translated text. It is set after calling the translate method.
#    Methods
# initialize(text_from) - The constructor method for the class. It takes the text_from argument and sets it as an
# instance variable.
# translate - Translates the text from text_from to Russian ('ru') and sets the result as text_to.
# This method uses the Google Cloud Translate API and requires the API_KEY to be set.
class GoogleTranslator
  API_KEY = ENV['API_KEY']
  attr_reader :text_from, :text_to

  def initialize(text_from)
    @text_from = text_from
  end

  def translate
    translate = Google::Cloud::Translate::V2.new(key: API_KEY)
    @text_to = translate.translate(@text_from, to: 'ru')
  end
end
