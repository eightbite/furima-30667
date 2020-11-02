class Form
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address, :building, :phone_number, :user_id, :item_id, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :address
    validates :building
    validates :phone_number, format: {with: /\A^(0{1}\d{9,10})\z/}
    validates :token
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Residence.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
    # 各テーブルにデータを保存する処理を書く
  end
end