ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.gmail.com',
  :domain         => 'mail.google.com',
  :port           => 587,
  :user_name      => '',
  :password       => '',
  :authentication => :plain,
  :enable_starttls_auto => true
}