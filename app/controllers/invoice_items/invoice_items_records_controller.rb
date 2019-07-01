class InvoiceItemsRecordsController < ApplicationController
  acceptable_queries = ["id", "item_id", "invoice_id", "quantity", "unit_price", "updated_at", "created_at"]

  get "/api/v1/invoice_items/find_all" do
    if !acceptable_queries.include?(params.keys.first)
      return InvoiceItemSerializer.new(InvoiceItem.all).to_json
    else
      return InvoiceItemSerializer.new(InvoiceItem.find_all(parsed)).to_json
    end
  end

  get "/api/v1/invoice_items/find" do
    if !acceptable_queries.include?(params.keys.first)
      return InvoiceItemSerializer.new(InvoiceItem.all).to_json
    else
      return InvoiceItemSerializer.new(InvoiceItem.find_by("#{parsed.keys.first} = ?", parsed.values.first)).to_json
    end
  end

  get "/api/v1/invoice_items/random" do
    InvoiceItemSerializer.new(InvoiceItem.random).to_json
  end

  get "/api/v1/invoice_items/:id" do
    InvoiceItemSerializer.new(InvoiceItem.find(parsed[:id])).to_json
  end

  get "/api/v1/invoice_items" do
    InvoiceItemSerializer.new(InvoiceItem.all).to_json
  end

  helpers do
    def parsed
      return {"unit_price" => (params[:unit_price].to_r * 100).to_i} if !params[:unit_price].nil?
      params
    end
  end
end
