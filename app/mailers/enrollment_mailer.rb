class EnrollmentMailer < ActionMailer::Base
  default from: "info@paperlessPT.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enrollment_mailer.client.subject
  #
  def client(client)

    @client = client

    mail(to: @client.email, subject: "Enrollment request")
  end
end
