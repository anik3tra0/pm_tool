ActionMailer::Base.smtp_settings = { 
   :address => "smtp.gmail.com",
   :port => 587,
   :domain => "gmail.com",
   :authentication => "plain",
   :enable_starttls_auto => true,
   :user_name => "anik3tra0@gmail.com",
   :password => "asdflkjhg$",
   :openssl_verify_mode  => 'none'
}