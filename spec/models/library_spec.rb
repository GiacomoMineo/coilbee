require 'rails_helper'

RSpec.describe Library, type: :model do

	it "is valid with a topic, description" do
		library = FactoryGirl.build(:library)
		expect(library).to be_valid
	end

	it "is valid without a description" do
		library = FactoryGirl.build(:library, description: nil)
		expect(library).to be_valid
	end
	
	it "is invalid without a topic" do
		library = FactoryGirl.build(:library, topic: nil)
		library.valid?
		expect(library.errors[:topic]).to include("can't be blank")
	end

end
