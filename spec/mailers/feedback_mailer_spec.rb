require "rails_helper"

RSpec.describe FeedbackMailer, type: :mailer do
  it "sends feedback" do
  	feedback = FactoryGirl.build(:feedback)
  	email = FeedbackMailer.send_feedback(feedback).deliver_now
  	
  end
end
