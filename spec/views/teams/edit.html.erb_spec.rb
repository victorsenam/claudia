require 'rails_helper'

RSpec.describe "teams/edit", type: :view do
  before(:each) do
    @team = assign(:team, create(:team))
    create(:user)
    create(:user).teams << @team
  end

  it "renders the edit team form" do
    render

    assert_select "form[action=?][method=?]", team_path(@team), "post" do

      assert_select "input#team_name[name=?]", "team[name]"

      User.all.each do |user|
        assert_select "input#team_users_#{user.id}[name=?][value='#{user.id}']#{'[checked]' if user.teams.include?(@team)}", 'team[users][]'
      end
    end
  end
end
