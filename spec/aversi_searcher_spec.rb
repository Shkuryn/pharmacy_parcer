# frozen_string_literal: true

require './aversi_searcher'

RSpec.describe AversiSearcher do
  let(:drug_name) { 'Paracetamol' }
  let(:details_text) { "<html><body><a href='/en/aversi/act/drugDet/?MatID=89545'><h5 class='product-title'>Paracetamol(Cetam)500mg#10t</h5><div class='price'><ins><span class='amount text-theme-colored'>0.70 Gel</span></ins></div></body></html>" }

  subject(:searcher) { described_class.new(drug_name) }

  describe '#initialize' do
    it 'sets drug_name' do
      expect(searcher.instance_variable_get(:@drug_name)).to eq(drug_name)
    end
  end

  describe "#save_drug" do
    let(:drug) { searcher.save_drug(details_text) }

    context "when the amount of the drug is not zero" do
      it "returns a drug object" do
        expect(drug).to be_a(Drug)
        expect(drug.title).to eq("Paracetamol(Cetam)500mg#10t")
        expect(drug.amount_with_discount).to eq(0.7)
        expect(drug.pharmacy).to eq(AversiSearcher::PHARMACY)
      end
    end

    context "when the amount of the drug is zero" do
      let(:details_text) { "<html><body><div class='product-title'>Aspirin</div><ins><span class='amount'>₾0</span></ins></body></html>" }

      it "returns nil" do
        expect(searcher.save_drug(details_text)).to be_nil
      end
    end
  end

  describe '#search' do
    it 'fetches drugs from Aversi' do
      expect(searcher).to receive(:save_drug).at_least(:once)
      searcher.search
    end
  end
end
