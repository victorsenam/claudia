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
