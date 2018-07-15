require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :age => 2,
        :graduate => "Graduate",
        :hobby => "Hobby"
      ),
      User.create!(
        :name => "Name",
        :age => 2,
        :graduate => "Graduate",
        :hobby => "Hobby"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Graduate".to_s, :count => 2
    assert_select "tr>td", :text => "Hobby".to_s, :count => 2
  end
end
