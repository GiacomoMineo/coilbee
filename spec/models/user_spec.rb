require 'rails_helper'

RSpec.describe User, :type => :model do
	it "is valid with a username, email and password" do
		expect(FactoryGirl.build(:user)).to be_valid
	end

	it "is invalid without a username" do
		user = FactoryGirl.build(:user, user_name: nil)
		user.valid?
		expect(user.errors[:user_name]).to include("can't be blank")
	end

	it "is invalid without an email address" do
		user = FactoryGirl.build(:user, email: nil)
		user.valid?
		expect(user.errors[:email]).to include("can't be blank")
	end

	it "is invalid without a password address" do
		user = FactoryGirl.build(:user, password: nil)
		user.valid?
		expect(user.errors[:password]).to include("can't be blank")
	end

	it "is invalid with a duplicate username" do
		FactoryGirl.create(:user, user_name: "Aaron")
		user = FactoryGirl.build(:user, user_name: "Aaron")
		user.valid?
		expect(user.errors[:user_name]).to include("has already been taken")
	end

	it "is invalid with a duplicate email address" do
		FactoryGirl.create(:user, email: "aaron@example.com")
		user = FactoryGirl.build(:user, email: "aaron@example.com")
		user.valid?
		expect(user.errors[:email]).to include("has already been taken")
	end

end
