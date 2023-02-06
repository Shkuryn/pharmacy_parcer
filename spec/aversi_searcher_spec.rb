# # frozen_string_literal: true
#
# require './aversi_searcher'
#
# RSpec.describe AversiSearcher do
#   subject { described_class.new(drug_name) }
#
#   let(:drug_name) { 'Paracetamol' }
#
#   describe '#initialize' do
#     it 'sets drug_name' do
#       expect(subject.instance_variable_get(:@drug_name)).to eq(drug_name)
#     end
#   end
#
#   describe '#save_drug' do
#     let(:details_text) do
#       '<div class="product-details">
#         <h3 class="product-title">Paracetamol</h3>
#         <ins class="amount">₾1.23</ins>
#       </div>'
#     end
#
#     it 'creates a new Drug with the correct attributes' do
#       subject.save_drug(details_text)
#       drug = Drug.first
#       expect(drug.title).to eq('Paracetamol')
#       expect(drug.amount_with_discount).to eq(1.23)
#       expect(drug.pharmacy).to eq('Aversi')
#     end
#   end
#
#   describe '#search' do
#     let(:product_details) do
#       [
#         '<div class="product-details">
#            <h3 class="product-title">Paracetamol</h3>
#            <ins class="amount">₾1.23</ins>
#          </div>',
#         '<div class="product-details">
#            <h3 class="product-title">Ibuprofen</h3>
#            <ins class="amount">₾4.56</ins>
#          </div>'
#       ]
#     end
#     let(:html_text) do
#       "<html>
#         <body>
#           <div class='product'>
#             #{product_details[0]}
#           </div>
#           <div class='product'>
#             #{product_details[1]}
#           </div>
#         </body>
#       </html>"
#     end
#
#     before do
#       allow(URI).to receive(:open).and_return(html_text)
#     end
#
#     it 'saves drugs with the correct attributes' do
#       subject.search
#       expect(Drug.count).to eq(2)
#       expect(Drug.first.title).to eq('Paracetamol')
#       expect(Drug.first.amount_with_discount).to eq(1.23)
#       expect(Drug.first.pharmacy).to eq('Aversi')
#       expect(Drug.last.title).to eq('Ibuprofen')
#       expect(Drug.last.amount_with_discount).to eq(4.56)
#       expect(Drug.last.pharmacy).to eq('Aversi')
#     end
#   end
# end
