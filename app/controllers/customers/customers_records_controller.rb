class CustomersRecordsController < ApplicationController
  acceptable_queries = ["id", "first_name", "last_name", "created_at", "updated_at"]

  get "/api/v1/customers/find_all" do
    if !acceptable_queries.include?(params.keys.first)
      return CustomerSerializer.new(Customer.all).to_json
    else
      return CustomerSerializer.new(Customer.find_all(params)).to_json
    end
  end

  get "/api/v1/customers/find" do
    if !acceptable_queries.include?(params.keys.first)
      return CustomerSerializer.new(Customer.all).to_json
    else
      return CustomerSerializer.new(Customer.find_by("#{params.keys.first} = ?", params.values.first)).to_json
    end
  end

  get "/api/v1/customers/:id" do
    CustomerSerializer.new(Customer.find(params[:id])).to_json
  end

  get "/api/v1/customers" do
    CustomerSerializer.new(Customer.all).to_json
  end
end
