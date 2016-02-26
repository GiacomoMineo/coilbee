require 'rails_helper'

RSpec.describe "informers/new", type: :view do
  before(:each) do
    assign(:informer, Informer.new(
      :email => "MyString"
    ))
  end

  it "renders new informer form" do
    render

    assert_select "form[action=?][method=?]", informers_path, "post" do

      assert_select "input#informer_email[name=?]", "informer[email]"
    end
  end
end
