require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = create(:event)
    team = create(:team)
    @event.teams << team
    @teams = @event.teams
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(@event.name)
    expect(rendered).to match(@teams[0].name)
  end
end
