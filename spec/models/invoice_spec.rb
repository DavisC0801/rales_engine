require "./spec/spec_helper"

RSpec.describe Invoice, type: :model do
  describe 'validations' do
    it {should validate_presence_of :status}
  end

  describe 'relationships' do
    it { should belong_to :customer }
    it { should belong_to :merchant }
    it { should have_many :transactions }
    it { should have_many :invoice_items }
    it { should have_many(:items).through(:invoice_items) }
  end

  describe "class methods" do
    it "find all transactions" do
      result = Invoice.all_transactions({id: 312})
      expect(result.first.id).to eq(360)
      expect(result.last.id).to eq(361)
      expect(result.count).to eq(2)
    end

    it "finds all items" do
      result = Invoice.all_items({id: 111})
      expect(result.count).to eq(5)
      expect(result.first.id).to eq(1764)
      expect(result.last.id).to eq(1735)
    end

    it "finds all invoice items" do
      result = Invoice.all_invoice_items({id: 222})
      expect(result.count).to eq(4)
      expect(result.first.id).to eq(1015)
      expect(result.last.id).to eq(1012)
    end

    it "finds the associated customer" do
      result = Invoice.customer({id: 333})
      expected = Customer.find(70)
      expect(result.id).to eq(expected.id)
      expect(result.created_at).to eq(expected.created_at)
      expect(result.updated_at).to eq(expected.updated_at)
    end

    it "finds the associated merchant" do
      result = Invoice.merchant.id({id: 444})
      expected = Merchant.find(37)
      expect(result.id).to eq(expected.id)
      expect(result.created_at).to eq(expected.created_at)
      expect(result.updated_at).to eq(expected.updated_at)
    end
  end
end
