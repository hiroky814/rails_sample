require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :age => 1,
      :graduate => "MyString",
      :hobby => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[name]"

      assert_select "input[name=?]", "user[age]"

      assert_select "input[name=?]", "user[graduate]"

      assert_select "input[name=?]", "user[hobby]"
    end
  end
end
