When(/^I fill "(.*?)" in "(.*?)"$/) do |value, field|
    fill_in field, with: value
end

When(/^I click the "(.*?)" button$/) do |button_name|
    click_button button_name
end

Then(/^I should see "(.*?)"$/) do |text|
    expect ( page ).to have_content text )
end
