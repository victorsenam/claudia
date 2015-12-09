class DummyController < ApplicationController
  def event_list
    @events = [
      {
        name: "Abertura",
        date: Time.new(2015, 7, 24, 12, 0, 0),
        image_url: "http://lorempixel.com/400/400/food/3",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec risus libero. Donec ac felis id nulla dignissim venenatis eget quis lectus. Mauris tincidunt mi nibh. Fusce condimentum ex ut neque rhoncus, eu interdum elit aliquet. Suspendisse metus leo, malesuada id dapibus non, porttitor ac erat."
      },
      {
        name: "Festa",
        date: Time.new(2016, 7, 27, 19, 30, 0),
        image_url: "http://lorempixel.com/400/400/nightlife/2",
        description: "Aliquam erat volutpat. Vivamus porta tempus leo sit amet convallis. Aliquam dapibus sem quis orci aliquet rutrum. Aliquam pellentesque viverra arcu, vitae facilisis odio lobortis quis. Nulla pharetra eu ante non tristique. Sed volutpat ullamcorper purus. Vivamus luctus risus eu ligula tristique, id congue risus vestibulum."
      },
      {
        name: "Fechamento",
        date: Time.new(2016, 7, 30, 14, 0, 0),
        image_url: "http://lorempixel.com/400/400/cats/7",
        description: "Aliquam erat volutpat. Vivamus porta tempus leo sit amet convallis. Aliquam dapibus sem quis orci aliquet rutrum. Aliquam pellentesque viverra arcu, vitae facilisis odio lobortis quis. Nulla pharetra eu ante non tristique. Sed volutpat ullamcorper purus. Vivamus luctus risus eu ligula tristique, id congue risus vestibulum."
      }
    ]
  end

  def event_show
    @event = {
      name: "Abertura",
      date: Time.new(2015, 7, 24, 12, 0, 0),
      image_url: "http://lorempixel.com/400/400/food/3",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec risus libero. Donec ac felis id nulla dignissim venenatis eget quis lectus. Mauris tincidunt mi nibh. Fusce condimentum ex ut neque rhoncus, eu interdum elit aliquet. Suspendisse metus leo, malesuada id dapibus non, porttitor ac erat."
    }
  end

  def event_edit
    @event = {
      name: "Abertura",
      date: Time.new(2015, 7, 24, 12, 0, 0),
      image_url: "http://lorempixel.com/400/400/food/3",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec risus libero. Donec ac felis id nulla dignissim venenatis eget quis lectus. Mauris tincidunt mi nibh. Fusce condimentum ex ut neque rhoncus, eu interdum elit aliquet. Suspendisse metus leo, malesuada id dapibus non, porttitor ac erat."
    }
  end
end
