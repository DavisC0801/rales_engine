class ItemsBusinessLogicController < ApplicationController
    get "/api/v1/items/most_revenue" do
      ItemSerializer.new(Item.most_revenue(params)).to_json
    end

    get "/api/v1/items/most_items" do
      ItemSerializer.new(Item.most_items(params)).to_json
    end

    get "/api/v1/items/:id/best_day" do
      DateSerializer.new(Item.best_day(params)).to_json
    end
end
