class Item < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  # with_options presence: true do
  #   validates :name
  #   validates :exposition
  #   validates :category_id
  #   validates :status_id
  #   validates :burden_id
  #   validates :area_id
  #   validates :day_id
  #   validates :price
  # end
end
