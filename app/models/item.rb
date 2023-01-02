class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details

  has_one_attached :image

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end


  def is_active_method
    if is_active == true
      '販売中'
    else
      '販売停止中'
    end
  end

  def with_tax_price
    (price * 1.1).floor
  end

end
