class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :image
    validates :name
    validates :exposition
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
    validates :price, 
              numericality: {
                only_integer: true,
                greater_than_or_equal_to: 300,
                less_than_or_equal_to: 9999999
              }
  end
end