require 'rails_helper'

RSpec.describe "teams/show", type: :view, pending: true do
  before(:each) do
    @team = assign(:team, Team.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
