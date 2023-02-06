# frozen_string_literal: true

require './translate'

RSpec.describe GoogleTranslator do
  let(:text_from) { 'Hello, world!' }
  subject { described_class.new(text_from) }

  describe '#initialize' do
    it 'sets text_from' do
      expect(subject.text_from).to eq(text_from)
    end
  end

  describe '#translate' do
    before do
      allow(Google::Cloud::Translate::V2).to receive(:new)
        .and_return(double(translate: translated_text))
    end

    let(:translated_text) { 'Привет, мир!' }

    it 'sets translated text' do
      subject.translate
      expect(subject.text_to).to eq(translated_text)
    end
  end
end
