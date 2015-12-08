require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      create(:event),
      create(:event)
    ])
  end

  it "renders a list of events" do
    render

    Event.all.each do |event|
      assert_select "tr>td", :text => event.name
      assert_select "tr>td", :text => event.date.to_s
      assert_select "tr>td", :text => event.image_url
      assert_select "tr>td", :text => event.description
    end
  end
end
