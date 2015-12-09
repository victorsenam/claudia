require 'rails_helper'

describe Event do
  context "on creation" do
    it "has a valid factory" do
      expect(build(:event)).to be_valid
    end

    it { should validate_presence_of(:name).with_message(" vazio!") }
  end

  describe "refresh event's teams associations" do
    before(:each) do
      @event = create(:event)
      @param = []

      create(:team)
      @param << create(:team).id.to_s
      @param << create(:team).id.to_s
    end

    it "associates every team whose id in on the array to given event" do
      @event.set_teams(@param)
      @event.reload
      @param.each do |el|
        expect(@event.teams).to include(Team.find(el.to_i))
      end
    end

    it "works ok when blank strings are sent on param" do
      @param << ""
      expect{ @event.set_teams(@param) }.not_to raise_error
    end

    it "removes old associations if they are not on params" do
      team = create(:team)
      @event.teams << team
      @event.set_teams(@param)
      @event.reload
      expect(@event.teams).not_to include(team)
    end

    it "clears teams when nil is sent on param" do
      @param = nil
      @event.set_teams(@param)
      expect( @event.teams.count ).to eq(0)
    end
  end
end
