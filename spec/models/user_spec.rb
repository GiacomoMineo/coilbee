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

	it "is invalid without an email address" do
		user = User.new(email: nil)
		user.valid?
		expect(user.errors[:email]).to include("can't be blank")
	end

	it "is invalid without a password address" do
		user = User.new(password: nil)
		user.valid?
		expect(user.errors[:password]).to include("can't be blank")
	end

	it "is invalid with a duplicate username" do
		user = User.create(
			user_name: 'Aaron',
			email: 'aaron@example.com',
			password: 'password')
		user = User.create(
			user_name: 'Aaron',
			email: 'tester@example.com',
			password: 'password')
		user.valid?
		expect(user.errors[:user_name]).to include("has already been taken")
	end

	it "is invalid with a duplicate email address" do
		user = User.create(
			user_name: 'Aaron',
			email: 'tester@example.com',
			password: 'password')
		user = User.create(
			user_name: 'Paul',
			email: 'tester@example.com',
			password: 'password')
		user.valid?
		expect(user.errors[:email]).to include("has already been taken")
	end


	it "returns a contact's username as a string"
	it "returns a contact's email as a string"
end
