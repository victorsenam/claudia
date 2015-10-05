require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, build(:user))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@user.name)
    expect(rendered).to match(@user.email)
    expect(rendered).to match(@user.rank.to_s)
  end
end
