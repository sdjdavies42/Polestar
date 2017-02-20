class ContactMailer < ActionMailer::Base
	default to: 'sdjdavies42@gmail.com'

	def contact_email(name, phone, email, message)
		@name = name
		@email = email
		@phone = phone
		@body = message
		mail(from: email, subject: 'Contact Form message')
	end	
end