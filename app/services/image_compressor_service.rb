class ImageCompressorService < ApplicationService
  include Rails.application.routes.url_helpers
  attr_reader :image

  def initialize(image)
    @image = image
  end

  def call
    if @image.uuid
      puts 'This image has been compressed before.'
      return
    end
    optimized_image = image.raw_image.variant(resize_to_limit: [50, 50]).processed # sort of optimization
    if optimized_image
      # compression success
      optimized_variant_url = Rails.application.routes.url_helpers.url_for(optimized_image)
      uuid = SecureRandom.uuid
      @image.update(uuid: uuid, optimized_variant_url: optimized_variant_url)
      NotificationMailer.with(image: @image, optimized_variant_url: optimized_variant_url).send_notification.deliver_now
    else
      # compression failed
      NotificationMailer.with(image: nil).send_notification.deliver_now
    end
  end
end