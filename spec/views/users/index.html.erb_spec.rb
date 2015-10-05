require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    @users = assign(:users, [
      build(:user),
      build(:user)
    ])
  end

  it "renders a list of users" do
    render
    @users.each do |user|
      assert_select "tr>td", :text => user.name
      assert_select "tr>td", :text => user.email
      assert_select "tr>td", :text => user.rank.to_s
    end
  end
end
