require 'rails_helper'

RSpec.describe User, type: :model do
	it "is valid with a username, email and password" do
		user = User.new(
			user_name: 'Aaron',
			email: 'tester@example.com',
			password: 'password')
		expect(user).to be_valid
	end

	it "is invalid without a username" do
		user = User.new(user_name: nil)
		user.valid?
		expect(user.errors[:user_name]).to include("can't be blank")
	end
	it "is invalid without an email address"
	it "is invalid with a duplicate username"
	it "is invalid with a duplicate email address"
	it "returns a contact's username as a string"
	it "returns a contact's email as a string"
end
