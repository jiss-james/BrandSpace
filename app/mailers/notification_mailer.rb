class NotificationMailer < ApplicationMailer

  def test
    mail(to: "test@example.com", subject: 'Welcome to My Awesome Site')
  end
  
end
