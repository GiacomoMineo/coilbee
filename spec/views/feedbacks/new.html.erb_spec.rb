require 'rails_helper'

RSpec.describe "feedbacks/new", type: :view do
  before(:each) do
    assign(:feedback, Feedback.new(
      :name => "MyString",
      :email => "MyString",
      :subject => "MyString",
      :content => "MyText"
    ))
  end

  it "renders new feedback form" do
    render

    assert_select "form[action=?][method=?]", feedbacks_path, "post" do

      assert_select "input#feedback_name[name=?]", "feedback[name]"

      assert_select "input#feedback_email[name=?]", "feedback[email]"

      assert_select "input#feedback_subject[name=?]", "feedback[subject]"

      assert_select "textarea#feedback_content[name=?]", "feedback[content]"
    end
  end
end
