Given(/^I( try to)? access the event creation page$/) do
  visit '/events/new'
end

Given(/^I fill the form with a valid event$/) do
  event = build(:event)
  
  fill_in 'Event', with: event.name
  fill_in 'Date', with: event.date
  fill_in 'Image', with: event.image_url
  fill_in 'Description', with: event.description
end
