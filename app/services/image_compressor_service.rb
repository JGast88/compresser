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

    puts 'Compressing...'
    # raw_image_path = rails_blob_path(@image.raw_image, only_path: true)
    # raw_image_path = @image.raw_image.variant(resize_to_limit: [50, 50]).processed.url
    # raw_image_path = Rails.application.routes.url_helpers.rails_blob_path(@image.raw_image)
    # raw_image_path = @image.raw_image.service_url
    # raw_image_path = URI.parse(@image.raw_image.service_url)

    # TODO: КАК ПОЛУЧИТЬ ПУТЬ КАРТИНКИ сохраненной ActiveStorage??? пока использовать заглушку
    raw_image_path = 'public/test.png'
    pipeline = ImageProcessing::Vips.source(raw_image_path)
    # optimized_image = pipeline.saver(quality: 50).call(destination: "public/compressed111.png")

    vips_image = pipeline
                .saver(quality: 25)
                .convert("png")
                .call(save: false)

    if vips_image.is_a?(Vips::Image)
      # compression success
      uuid = SecureRandom.uuid
      vips_image.write_to_file("public/compressed_images/#{uuid}.png")
      image_format = @image.raw_image.blob[:filename].split('.')[-1]
      @image.update(uuid: uuid, image_format: image_format)

      puts 'Sending notification...'
      # email notification
      NotificationMailer.with(image: @image).send_notification.deliver_now
    else
      # compression failed
      NotificationMailer.with(image: nil).send_notification.deliver_now
    end
  end
end