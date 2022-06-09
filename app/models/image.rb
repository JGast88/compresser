class Image < ApplicationRecord
  include Rails.application.routes.url_helpers
  LOCALHOST = 'http://localhost:3000/'.freeze

  validates :email, presence: true
  has_one_attached :raw_image

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
