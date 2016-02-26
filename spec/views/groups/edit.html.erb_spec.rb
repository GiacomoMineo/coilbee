require 'rails_helper'

RSpec.describe "groups/edit", type: :view do
  before(:each) do
    @group = assign(:group, Group.create!(
      :name => "MyString",
      :library_id => 1
    ))
  end

  it "renders the edit group form" do
    render

    assert_select "form[action=?][method=?]", group_path(@group), "post" do

      assert_select "input#group_name[name=?]", "group[name]"

      assert_select "input#group_library_id[name=?]", "group[library_id]"
    end
  end
end
