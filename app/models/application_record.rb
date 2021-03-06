class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.find_all(params)
    where("#{params.keys.first} = ?", params.values.first)
  end

  def self.random
    order("RANDOM()").take
  end
end
