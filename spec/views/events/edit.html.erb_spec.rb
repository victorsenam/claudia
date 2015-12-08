require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :name => "MyText",
      :image_url => "MyText",
      :description => "MyText"
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "textarea#event_name[name=?]", "event[name]"

      assert_select "textarea#event_image_url[name=?]", "event[image_url]"

      assert_select "textarea#event_description[name=?]", "event[description]"
    end
  end
end
