require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :email => "Email",
        :password => "Password",
        :password_digest => "Password Digest",
        :rank => 1
      ),
      User.create!(
        :name => "Name",
        :email => "Email",
        :password => "Password",
        :password_digest => "Password Digest",
        :rank => 1
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
