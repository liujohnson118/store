class Review < ActiveRecord::Base
  belongs_to :product
  validates :product_id, numericality: { only_integer: true }
  validates :user_id, numericality: { only_integer: true }
  validates :rating, numericality: { only_integer: true }
end
