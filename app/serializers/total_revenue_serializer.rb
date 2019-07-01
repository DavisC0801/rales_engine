class TotalRevenueSerializer
  include FastJsonapi::ObjectSerializer
  attribute :total_revenue do |object|
    (object.sum.to_f / 100).to_s.ljust(2, "0")
  end
end
