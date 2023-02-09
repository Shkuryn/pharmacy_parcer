# frozen_string_literal: true

require './aversi_searcher'

RSpec.describe AversiSearcher do
  subject { described_class.new(drug_name) }

  let(:drug_name) { 'Paracetamol' }

  describe '#initialize' do
    it 'sets drug_name' do
      expect(subject.instance_variable_get(:@drug_name)).to eq(drug_name)
    end
  end

  let(:details_text) { "<html><body><div class='product-title'>Aspirin</div><ins><span class='amount'>₾5</span></ins></body></html>" }

  describe "#save_drug" do
    context "when the amount of the drug is not zero" do
      it "returns a drug object" do
        searcher = described_class.new(drug_name)
        drug = searcher.save_drug(details_text)

        expect(drug).to be_a(Drug)
        expect(drug.title).to eq("Aspirin")
        expect(drug.amount_with_discount).to eq(5.0)
        expect(drug.pharmacy).to eq(AversiSearcher::PHARMACY)
      end
    end

    context "when the amount of the drug is zero" do
      it "returns nil" do
        details_text = "<html><body><div class='product-title'>Aspirin</div><ins><span class='amount'>₾0</span></ins></body></html>"
        searcher = described_class.new(drug_name)
        drug = searcher.save_drug(details_text)

        expect(drug).to be_nil
      end
    end
  end

  # describe '#search' do
  #   let(:product_details) do
  #     [
  #       '<div class="product-details">
  #          <h3 class="product-title">Paracetamol</h3>
  #          <ins class="amount">₾1.23</ins>
  #        </div>',
  #       '<div class="product-details">
  #          <h3 class="product-title">Ibuprofen</h3>
  #          <ins class="amount">₾4.56</ins>
  #        </div>'
  #     ]
  #   end
  #   let(:html_text) do
  #     "<html>
  #       <body>
  #         <div class='product'>
  #           #{product_details[0]}
  #         </div>
  #         <div class='product'>
  #           #{product_details[1]}
  #         </div>
  #       </body>
  #     </html>"
  #   end
  #
  #   before do
  #     allow(URI).to receive(:open).and_return(html_text)
  #   end
  #
  #   it 'saves drugs with the correct attributes' do
  #     subject.search
  #     expect(Drug.count).to eq(2)
  #     expect(Drug.first.title).to eq('Paracetamol')
  #     expect(Drug.first.amount_with_discount).to eq(1.23)
  #     expect(Drug.first.pharmacy).to eq('Aversi')
  #     expect(Drug.last.title).to eq('Ibuprofen')
  #     expect(Drug.last.amount_with_discount).to eq(4.56)
  #     expect(Drug.last.pharmacy).to eq('Aversi')
  #   end
  # end
  #
end
