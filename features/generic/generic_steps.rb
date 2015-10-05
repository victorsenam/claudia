When(/^I fill the "(.*?)" filed with "(.*?)"$/) do |field, value|
  fill_in(field, with: value)
end

When(/^I click the "(.*?)" button$/) do |button|
  click_button(button)  
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end
