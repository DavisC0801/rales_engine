require "./spec/spec_helper"

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it {should validate_presence_of :first_name }
    it {should validate_presence_of :last_name }
  end

  describe 'relationships' do
    it { should have_many :invoices }
  end

  describe "class methods" do
    it "finds a favorite merchant" do
      expected = Merchant.find(49)
      result = Customer.favorite_merchant({id: 66})
      expect(result[:id]).to eq(expected[:id])
      expect(result[:created_at]).to eq(expected[:created_at])
      expect(result[:updated_at]).to eq(expected[:updated_at])
    end

    it "finds all associated invoices" do
      result = Customer.all_invoices({id: 29})
      expect(result.first.id).to eq(157)
      expect(result.last.id).to eq(151)
      expect(result.count).to eq(7)
    end

    it "finds all associated transactions" do
      result = Customer.all_invoices({id: 29})
      expect(result.first.id).to eq(175)
      expect(result.last.id).to eq(168)
      expect(result.count).to eq(8)
    end
  end
end
