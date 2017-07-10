class Product < ActiveRecord::Base
  has_many :reviews
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category

  validates :name, presence: true, length: { minimum: 1 }
  validates :price, numericality: true
  validates :quantity, numericality: {only_integer: true}
  validates :category, presence: true

end
