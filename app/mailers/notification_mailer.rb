class NotificationMailer < ApplicationMailer
  default from: "no-reply@nomsterapp.com"

  def comment_added comment
    @place = comment.place
    @user = @place.user
    mail(to: "#{@user.email}",
         subject: "Somebody has left a comment on #{@place.name}!")
  end
end
