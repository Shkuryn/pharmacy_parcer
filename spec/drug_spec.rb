require 'rspec'
require './drug'

describe Drug do
  let(:drug_1) { Drug.new }
  let(:drug_2) { Drug.new }

  before do
    drug_1.title = 'Aspirin'
    drug_1.amount_with_discount = 50
    drug_1.pharmacy = 'Pharmacy 1'

    drug_2.title = 'Paracetamol'
    drug_2.amount_with_discount = 70
    drug_2.pharmacy = 'Pharmacy 2'
  end

  describe '.all' do
    it 'returns all the instances of the Drug class' do
      expect(Drug.all).to eq [drug_1, drug_2]
    end
  end

  describe '.display_drugs' do
    it 'sorts the drugs by amount_with_discount in ascending order' do
      allow(Drug).to receive(:puts)
      Drug.display_drugs
      expect(Drug.all.first).to eq drug_1
      expect(Drug.all.last).to eq drug_2
    end
  end
end
