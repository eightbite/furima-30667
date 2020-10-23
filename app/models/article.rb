class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :area, :nurden, :day, :item, :status

  with_options presence: true do
    validates :title
    validates :text
    validates :category
    validates :status
    validates :burden
    validates :area
    validates :day
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end
end
