class Product < ActiveRecord::Base
  validates :sku, length: { in: 10..15 }
  validates :name, presence: true
  validates :sku, presence: true
  validates :category, presence: true
end
