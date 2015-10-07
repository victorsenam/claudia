require 'rails_helper'

RSpec.describe "users/login", type: :view do
  before(:each) do
  end

  it "renders a login form" do
    render

    assert_select "form[action=?][method=?]", users_login_path, "post" do
    
      assert_select "input#user_login[name=?]", "auth[login]"

      assert_select "input#user_password[name=?]", "auth[password]"

    end
  end
end
