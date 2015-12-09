Given(/^I(?: try to|) access the event creation page$/) do
  visit '/events/new'
end

Given(/^I fill the form with a valid event$/) do
  event = build(:event)

  fill_in 'Nome', with: event.name
  select event.date.year, from: 'event_date_1i'
  select Date::MONTHNAMES[event.date.month], from: 'event_date_2i'
  select event.date.day, from: 'event_date_3i'
  select event.date.hour.to_s.rjust(2, padstr='0'), from: 'event_date_4i'
  select event.date.min.to_s.rjust(2, padstr='0'), from: 'event_date_5i'
  fill_in 'Imagem', with: event.image_url
  fill_in 'Descrição', with: event.description
end

Given(/^I have a registered event$/) do
  @last_event = create(:event)
end

When(/^I visit that event's edit page$/) do
  visit "/events/#{@last_event.id}/edit"
end

When(/^I visit that event's show page$/) do
  visit "/events/#{@last_event.id}"
end

When(/^I visit the event list page$/) do
  visit "/events/"
end

Then(/^I should( not)? see that event's name$/) do |negate|
  if (negate)
    expect( page ).not_to have_content( @last_event.name )
  else
    expect( page ).to have_content( @last_event.name )
  end
end

