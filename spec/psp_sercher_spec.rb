# frozen_string_literal: true

require './psp_searcher'
require './drug'
require './translate'
require 'nokogiri'

RSpec.describe PspSearcher do
  describe '#initialize' do
    it 'initializes with a drug name' do
      searcher = PspSearcher.new('aspirin')
      expect(searcher.drug_name).to eq 'aspirin'
    end
  end

  describe '#save_drug' do
    let(:searcher) { PspSearcher.new('aspirin') }

    it 'saves a drug with a given title and amount' do
      drug = searcher.save_drug('Aspirin', 10)
      expect(drug.title).to eq 'Aspirin'
      expect(drug.amount_with_discount).to eq 10
      expect(drug.pharmacy).to eq 'PSP'
    end

    it 'returns nil if amount is zero' do
      expect(searcher.save_drug('Aspirin', 0)).to be_nil
    end
  end

  describe '#search' do
    let(:searcher) { PspSearcher.new('aspirin') }
    let(:browser) { instance_double(Ferrum::Browser) }

    before do
      allow(Ferrum::Browser).to receive(:new).and_return(browser)
      allow(browser).to receive(:quit)
    end

    it 'performs a search on a specified website' do
      expect(browser).to receive(:goto).with("https://psp.ge/catalogsearch/result?q=aspirin&page=1")
      expect(browser).to receive(:body).and_return('<html>...</html>')
      searcher.search
    end
  end
end