class Image < ApplicationRecord
  include Rails.application.routes.url_helpers
  LOCALHOST = 'http://localhost:3000/'.freeze

  has_one_attached :raw_image do |attachable|
    attachable.variant :optimized, resize_to_limit: [10, 710]
  end

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :raw_image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 0..5.megabytes }

  def compressed_image_path
    "compressed_images/#{uuid}.png"
  end

  def compressed_image_url
    LOCALHOST + compressed_image_path
  end

  def compressed_image_download_path
    "images/#{uuid}/download"
  end

  def compressed_image_download_url
    LOCALHOST + compressed_image_download_path
  end

  def compressed_image_link
    "<a href=" + compressed_image_url + ">Download</a>"
  end
end
