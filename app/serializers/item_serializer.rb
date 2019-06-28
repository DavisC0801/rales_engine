class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :merchant_id

  attribute :unit_price do |object|
    (object.unit_price.to_f.to_r / 100).to_f.to_s
  end
end
