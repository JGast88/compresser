class NotificationMailer < ApplicationMailer
  def send_notification
    @image = params[:image]
    text = if @image
      "Compress succeed!"
    else
      'Compress failed!'
    end

    mail(to: 'jgast88@yandex.ru', subject: text)
  end
end
