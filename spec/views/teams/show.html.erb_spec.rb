require 'rails_helper'

RSpec.describe "teams/show", type: :view do
  before(:each) do
    @team = create(:team)
    user = create(:user)
    @team.users << user
    @users = @team.users
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@team.name)
    expect(rendered).to match(@users[0].name)
  end
end
