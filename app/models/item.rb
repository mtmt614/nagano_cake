class Item < ApplicationRecord
  belongs_to :genre
  
  has_one_attached :image
  
  def sale_status_method
    if sale_status == true
      '販売中'
    else
      '販売停止中'
    end
  end
  
  def with_tax_price
    (price * 1.1).floor
  end

end
