require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the TeamsHelper. For example:
#
# describe TeamsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe TeamsHelper, type: :helper do
  describe "refresh team's users associations" do
    before(:each) do
      @team = create(:team)
      @param = []

      create(:user)
      @param << create(:user).id.to_s
      @param << create(:user).id.to_s
    end

    it "associates every user whose id in on the array to given team" do
      helper.set_team_users(@team, @param)
      @param.each do |el|
        expect(@team.users).to include(User.find(el.to_i))
      end
    end

    it "works ok when blank strings are sent on param" do
      @param << ""
      expect{ helper.set_team_users(@team, @param) }.not_to raise_error
    end

    it "removes old associations if they are not on params" do
      user = create(:user)
      @team.users << user
      helper.set_team_users(@team, @param)
      expect(@team.users).not_to include(user)
    end
  end
end
