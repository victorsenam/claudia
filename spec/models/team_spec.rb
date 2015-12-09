require 'rails_helper'

RSpec.describe Team, type: :model do
  context "on creation" do
    it "has a valid factory" do
      expect(build(:team)).to be_valid
    end

    it { should validate_presence_of(:name).with_message(" vazio!") }
  end

  describe "refresh team's users associations" do
    before(:each) do
      @team = create(:team)
      @param = []

      create(:user)
      @param << create(:user).id.to_s
      @param << create(:user).id.to_s
    end

    it "associates every user whose id in on the array to given team" do
      @team.set_users(@param)
      @team.reload
      @param.each do |el|
        expect(@team.users).to include(User.find(el.to_i))
      end
    end

    it "works ok when blank strings are sent on param" do
      @param << ""
      expect{ @team.set_users(@param) }.not_to raise_error
    end

    it "removes old associations if they are not on params" do
      user = create(:user)
      @team.users << user
      @team.set_users(@param)
      @team.reload
      expect(@team.users).not_to include(user)
    end
  end
end
