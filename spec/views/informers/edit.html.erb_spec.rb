require 'rails_helper'

RSpec.describe "informers/edit", type: :view do
  before(:each) do
    @informer = assign(:informer, Informer.create!(
      :email => "MyString"
    ))
  end

  it "renders the edit informer form" do
    render

    assert_select "form[action=?][method=?]", informer_path(@informer), "post" do

      assert_select "input#informer_email[name=?]", "informer[email]"
    end
  end
end
