require 'rails_helper'

RSpec.describe "informers/index", type: :view do
  before(:each) do
    assign(:informers, [
      Informer.create!(
        :email => "Email"
      ),
      Informer.create!(
        :email => "Email"
      )
    ])
  end

  it "renders a list of informers" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
