require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new)
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "textarea#event_name[name=?]", "event[name]"

      assert_select "textarea#event_image_url[name=?]", "event[image_url]"

      assert_select "textarea#event_description[name=?]", "event[description]"
    end
  end
end
