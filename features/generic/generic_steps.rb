When(/^I fill the "(.*?)" filed with "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^I click the "(.*?)" button$/) do |button|
  
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end
