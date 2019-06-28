class RevenueSerializer
  include FastJsonapi::ObjectSerializer
  attribute :revenue do |object|
    (object.sum.to_f / 100).to_s.ljust(2, "0")
  end
end
