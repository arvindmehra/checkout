require_relative '../lib/checkout'

RSpec.describe Checkout do
  let(:checkout) { Checkout.new }

  describe '#scan' do
    it 'adds the item to the items hash' do
      checkout.scan('A')
      expect(checkout.items['A']).to eq(1)
    end

    it 'increments the quantity of an existing item' do
      checkout.scan('A')
      checkout.scan('A')
      checkout.scan('B')
      expect(checkout.items['A']).to eq(2)
      expect(checkout.items['B']).to eq(1)
    end

    it 'discards items that are not in the ITEMS constant' do
      checkout.scan('D')
      expect(checkout.items['D']).to eq(0)
    end
  end

  describe '#total' do
    context 'when there are no items scanned' do
      it 'returns 0' do
        expect(checkout.total).to eq(0)
      end
    end

    context 'when there are items scanned' do
      before do
        checkout.scan('A')
        checkout.scan('B')
        checkout.scan('C')
      end

      it 'calculates the total price based on the regular prices' do
        expect(checkout.total).to eq(100)
      end
    end

    context 'when there are mutiple items scanned' do
      before do
        checkout.scan('A')
        checkout.scan('B')
        checkout.scan('C')
        checkout.scan('A')
        checkout.scan('B')
        checkout.scan('B')
      end

      it 'calculates the total price based on the dicounted pricing' do
        expect(checkout.total).to eq(185)
      end
    end
  end
end

