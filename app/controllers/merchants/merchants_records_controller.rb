class MerchantsRecordsController < ApplicationController
  acceptable_queries = ["id", "name", "created_at", "updated_at"]

  get "/api/v1/merchants/find_all" do
    if !acceptable_queries.include?(params.keys.first)
      return MerchantSerializer.new(Merchant.all).to_json
    else
      return MerchantSerializer.new(Merchant.find_all(params)).to_json
    end
  end

  get "/api/v1/merchants/find" do
    if !acceptable_queries.include?(params.keys.first)
      return MerchantSerializer.new(Merchant.all).to_json
    else
      return MerchantSerializer.new(Merchant.find_by("#{params.keys.first} = ?", params.values.first)).to_json
    end
  end

  get "/api/v1/merchants/:id" do
    MerchantSerializer.new(Merchant.find(params[:id])).to_json
  end

  get "/api/v1/merchants" do
    MerchantSerializer.new(Merchant.all).to_json
  end
end
