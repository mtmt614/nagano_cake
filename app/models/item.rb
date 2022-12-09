class Item < ApplicationRecord
  belongs_to :genre
  has_one_attached :item_image
  
  def with_tax_price
    (price * 1.1).floor
  end

end
