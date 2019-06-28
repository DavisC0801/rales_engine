class CustomersBusinessLogicController < ApplicationController
  get "/api/v1/customers/:id/favorite_merchant" do
    MerchantSerializer.new(Customer.favorite_merchant(params)).to_json
  end
end
