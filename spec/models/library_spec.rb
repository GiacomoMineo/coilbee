require 'rails_helper'

RSpec.describe Library, type: :model do

	it "is valid with a topic, description" do
		library = Library.new(
			topic: 'Library-Title',
			description: 'Library-Description'
			)
		expect(library).to be_valid
	end

	it "is valid without a description" do
		library = Library.new(
			topic: "Library-title", 
			description: nil
			)
		expect(library).to be_valid
	end
	
	it "is invalid without a topic" do
		library = Library.new(topic: nil)
		library.valid?
		expect(library.errors[:topic]).to include("can't be blank")
	end

end
