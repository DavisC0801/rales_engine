require "./spec/spec_helper"

RSpec.describe InvoiceItem, type: :model do
  describe 'validations' do
    it {should validate_presence_of :quantity}
    it {should validate_presence_of :unit_price}
  end

  describe 'relationships' do
    it { should belong_to :invoice }
    it { should belong_to :item }
  end

  describe "class methods" do
    it "finds the item associated with the invoice_item" do
      expected = Item.find(529)
      result = InvoiceItem.item({id: 5})

      expect(result.id).to eq(expected.id)
      expect(result.unit_price).to eq(expected.unit_price)
      expect(result.created_at).to eq(expected.created_at)
      expect(result.updated_at).to eq(expected.updated_at)
    end

    it "find the invoice associated with the invoice_item" do
      expected = Invoice.find(1)
      result = InvoiceItem.invoice({id: 5})

      expect(result.id).to eq(expected.id)
      expect(result.unit_price).to eq(expected.unit_price)
      expect(result.created_at).to eq(expected.created_at)
      expect(result.updated_at).to eq(expected.updated_at)
    end
  end
end
