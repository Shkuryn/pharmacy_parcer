# =begin
# # frozen_string_literal: true
#
# require './psp_searcher'
# require './drug'
# require './translate'
#
# RSpec.describe PspSearcher do
#   let(:drug_name) { "paracetamol" }
#   let(:psp_searcher) { PspSearcher.new(drug_name) }
#
#   describe "#initialize" do
#     it "sets the drug_name instance variable" do
#       expect(psp_searcher.instance_variable_get(:@drug_name)).to eq(drug_name)
#     end
#   end
#
#   describe "#save_drug" do
#     let(:text) { "Парацетамол - сироп парацетамола 100мл 5.72₾ 8.00₾ -29%" }
#     let(:drug) { psp_searcher.save_drug(text) }
#
#     it "returns an instance of the Drug class" do
#       expect(drug).to be_a(Drug)
#     end
#
#     it "sets the title of the drug" do
#       expect(drug.title).to eq("Парацетамол - сироп парацетамола 100мл")
#     end
#
#     it "sets the amount_with_discount of the drug" do
#       expect(drug.amount_with_discount).to eq(5.72)
#     end
#
#     it "sets the pharmacy of the drug" do
#       expect(drug.pharmacy).to eq("PSP")
#     end
#   end
#
#   describe '#search' do
#     let(:browser) { instance_double("Ferrum::Browser") }
#     let(:elements) { [element1, element2] }
#     let(:element1) { instance_double("Element", text: "Element 1 Text") }
#     let(:element2) { instance_double("Element", text: "Element 2 Text") }
#     let(:gt1) { double(:gt1, translate: true, text_to: "Translated Element 1 Text") }
#     let(:gt2) { double(:gt2, translate: true, text_to: "Translated Element 2 Text") }
#
#     before do
#       allow(Ferrum::Browser).to receive(:new).with(headless: true).and_return(browser)
#       allow(browser).to receive(:goto).with("https://psp.ge/catalogsearch/result?q=paracetamol")
#       allow(browser).to receive(:css).with('.product').and_return(elements)
#       allow(browser).to receive(:quit)
#       allow(GoogleTranslator).to receive(:new).with("Element 1 Text").and_return(gt1)
#       allow(GoogleTranslator).to receive(:new).with("Element 2 Text").and_return(gt2)
#     end
#
#     it "searches for the drug using Ferrum" do
#       expect(Ferrum::Browser).to receive(:new).with(headless: true).and_return(browser)
#       expect(browser).to receive(:goto).with("https://psp.ge/catalogsearch/result?q=paracetamol")
#       expect(browser).to receive(:css).with('.product').and_return(elements)
#       expect(browser).to receive(:quit)
#       expect(GoogleTranslator).to receive(:new).with("Element 1 Text").and_return(gt1)
#       expect(GoogleTranslator).to receive(:new).with("Element 2 Text").and_return(gt2)
#       expect(gt1).to receive(:translate)
#       expect(gt2).to receive(:translate)
#
#       psp_searcher.search
#     end
#   end
#
# end
# =end
