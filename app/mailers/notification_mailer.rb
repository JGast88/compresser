class NotificationMailer < ApplicationMailer
  def send_notification
    @image = params[:image]
    text = if @image
      "Compress succeed!"
    else
      'Compress failed!'
    end

    mail(to: @image.email, subject: text)
  end
end
