class Form
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address, :building, :phone_number, :user_id, :item_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code
    validates :area_id
    validates :city
    validates :address
    validates :building
    validates :phone_number
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Residence.create(postal_code: postal_code, area_id: area_id, city: city, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
    # 各テーブルにデータを保存する処理を書く
  end
end