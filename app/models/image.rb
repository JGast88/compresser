class Image < ApplicationRecord
  validates :email, presence: true
  has_one_attached :raw_image
end
