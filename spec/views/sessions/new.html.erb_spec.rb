require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do
  it "renders a login form" do
    assign(:errors, [])

    render

    assert_select "form[action=?][method=?]", sessions_create_path, "post" do
      
      assert_select "input#email[name=?]", "email"

      assert_select "input#password[name=?]", "password"

    end
  end

  it "prints errors from the errors hash" do
    errors = ['Test errors']
    assign(:errors, errors)

    render
    
    errors.each do |error|
      expect( rendered ).to match error
    end
  end
end
