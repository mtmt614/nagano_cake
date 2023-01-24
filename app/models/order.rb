class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}

  def order_amount
    @total = 0
    self.order_details.each do |order_detail|
      @total += order_detail.amount
    end
    return @total
  end
end
