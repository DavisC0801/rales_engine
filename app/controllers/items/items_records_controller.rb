class ItemsRecordsController < ApplicationController
  acceptable_queries = ["id", "name", "description", "unit_price", "merchant_id", "created_at", "updated_at"]

  get "/api/v1/items/find_all" do
    if !acceptable_queries.include?(params.keys.first)
      return ItemSerializer.new(Item.all).to_json
    else
      return ItemSerializer.new(Item.find_all(parsed)).to_json
    end
  end

  get "/api/v1/items/find" do
    if !acceptable_queries.include?(params.keys.first)
      return ItemSerializer.new(Item.all).to_json
    else
      return ItemSerializer.new(Item.find_by("#{parsed.keys.first} = ?", parsed.values.first)).to_json
    end
  end

  get "/api/v1/items/random" do
    ItemSerializer.new(Item.random).to_json
  end

  get "/api/v1/items/:id" do
    ItemSerializer.new(Item.find(params[:id])).to_json
  end

  get "/api/v1/items" do
    ItemSerializer.new(Item.all).to_json
  end

  helpers do
    def parsed
      return {"unit_price" => (params[:unit_price].to_r * 100).to_i} if !params[:unit_price].nil?
      params
    end
  end
end
