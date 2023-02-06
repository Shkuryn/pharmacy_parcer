# frozen_string_literal: true
# # frozen_string_literal: true
#
# require 'spec_helper'
# require './psp_searcher'
# require './drug'
# require './translate'
#
# require 'spec_helper'
# require './psp_searcher'
#
# # frozen_string_literal: true
#
# require './psp_searcher'
# require './drug'
#
# describe PspSearcher do
#   let(:drug_name) { 'ibuprofen' }
#   let(:searcher) { described_class.new(drug_name) }
#
#   before do
#     allow(Selenium::WebDriver).to receive(:for).and_return(driver)
#     # allow(driver).to receive(:navigate).and_return(double(to: true))
#     allow(driver).to receive(:find_elements).and_return(elements)
#     allow(driver).to receive(:quit)
#   end
#
#   let(:driver) { instance_double('Selenium::WebDriver') }
#   let(:elements) do
#     [instance_double('Selenium::WebDriver::Element', text: 'Ibuprofen 400mg tablet 10pcs'),
#      instance_double('Selenium::WebDriver::Element', text: 'Ibuprofen 200mg tablet 20pcs')]
#   end
#
#   describe '#search' do
#     # it 'navigates to the search results page' do
#     #   expect(driver).to receive(:navigate).with(hash_including(to: "https://psp.ge/catalogsearch/result?q=#{drug_name}"))
#     #   searcher.search
#     # end
#
#     it 'finds the elements with class "product"' do
#       expect(driver).to receive(:find_elements).with(class: 'product')
#       searcher.search
#     end
#
#     it 'saves each element as a drug' do
#       elements.each do |element|
#         expect(searcher).to receive(:save_drug).with(element.text)
#       end
#       searcher.search
#     end
#
#     it 'quits the web driver' do
#       expect(driver).to receive(:quit)
#       searcher.search
#     end
#   end
# end
