class Image < ApplicationRecord
  has_one_attached :raw_image
end
