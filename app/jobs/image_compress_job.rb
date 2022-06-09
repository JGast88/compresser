class ImageCompressJob < ApplicationJob
  queue_as :default

  def perform(image_id)
    puts 'Compress job started!'
    image = Image.find(image_id)
    ImageCompressorService.call(image)
  end
end
