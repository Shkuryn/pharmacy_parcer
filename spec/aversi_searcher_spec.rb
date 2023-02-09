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

  let(:details_text) { "<html><body><a href='/en/aversi/act/drugDet/?MatID=89545'><h5 class='product-title'>Paracetamol(Cetam)500mg#10t</h5>
<div class='price'>

<ins>
<span class='amount text-theme-colored'>0.70 Gel</span></ins>
</div>
/body></html>
" }

  describe "#save_drug" do
    context "when the amount of the drug is not zero" do
      it "returns a drug object" do
        searcher = described_class.new(drug_name)
        drug = searcher.save_drug(details_text)

        expect(drug).to be_a(Drug)
        expect(drug.title).to eq("Paracetamol(Cetam)500mg#10t")
        expect(drug.amount_with_discount).to eq(0.7)
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
  #
  #     let(:drug_name) { 'Aspirin' }
  #     let(:html) do
  #       <<~HTML
  #     <html>
  #       <body>
  #         <div class="product">
  #           <div class="product-details">
  #             <div class="product-title">Aspirin</div>
  #             <div class="amount"><ins><span class="amount">₾10.0</span></ins></div>
  #           </div>
  #         </div>
  #       </body>
  #     </html>
  #       HTML
  #     end
  #
  #     before do
  #       allow(URI).to receive(:open).with("https://www.aversi.ge/en/aversi/act/searchMedicine/?kw_en=#{drug_name}").and_return(html)
  #     end
  #
  #     it 'saves the drug to the database' do
  #       expect { subject.search }.to change { Drug.count }.by(1)
  #     end
  #
  #     it 'saves the correct drug information' do
  #       subject.search
  #       drug = Drug.last
  #
  #       # expect(drug.title).to eq('Aspirin')
  #       expect(drug.amount_with_discount).to eq(10.0)
  #       expect(drug.pharmacy).to eq(AversiSearcher::PHARMACY)
  #     end
  # end
  # #
end
