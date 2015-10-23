class FeedbackMailer < ApplicationMailer
	default :to => "linkhoven@gmail.com"
	def send_feedback(feedback)
		@feedback = feedback
		mail from: @feedback.email, subject: @feedback.subject, body: @feedback.content
	end
end
