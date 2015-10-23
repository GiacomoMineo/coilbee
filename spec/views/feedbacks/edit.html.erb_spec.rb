require 'rails_helper'

RSpec.describe "feedbacks/edit", type: :view do
  before(:each) do
    @feedback = assign(:feedback, Feedback.create!(
      :name => "MyString",
      :email => "MyString",
      :subject => "MyString",
      :content => "MyText"
    ))
  end

  it "renders the edit feedback form" do
    render

    assert_select "form[action=?][method=?]", feedback_path(@feedback), "post" do

      assert_select "input#feedback_name[name=?]", "feedback[name]"

      assert_select "input#feedback_email[name=?]", "feedback[email]"

      assert_select "input#feedback_subject[name=?]", "feedback[subject]"

      assert_select "textarea#feedback_content[name=?]", "feedback[content]"
    end
  end
end
