class NotificationMailer < ApplicationMailer
  default from: "no-reply@nomsterapp.com"

  def comment_added
    mail(to: "iaminaband@gmail.com",
         subject: "Somebody has left a comment on your place!")
  end
end
