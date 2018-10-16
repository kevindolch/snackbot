class Item < ActiveRecord::Base
  belongs_to :list
  def self.total_cost_of_list(list_id)
    Item.where(list_id: list_id).select("sum(price) as total").first[:total]
  end
end
