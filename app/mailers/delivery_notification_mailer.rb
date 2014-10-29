class DeliveryNotificationMailer < ActionMailer::Base
  default from: "aimozs@me.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.delivery_notification_mailer.notify.subject
  #
  def notify(programme)
    @programme = programme
    @client = User.where('id = ?', programme.client).first
    @greeting = "Hi"


    mail(to: 'aimozs@gmail.com', subject: "Programme getting close to due date")
  end

  def notify(programme)
    @programme = programme
    @client = User.where('id = ?', programme.client).first
    @greeting = "Hi"


    mail(to: 'aimozs@gmail.com', subject: "Programme getting close to due date")
  end
end
