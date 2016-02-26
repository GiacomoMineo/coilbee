require 'rails_helper'

RSpec.describe "informers/show", type: :view do
  before(:each) do
    @informer = assign(:informer, Informer.create!(
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
  end
end
