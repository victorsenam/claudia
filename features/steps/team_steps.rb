Given(/^I am at the team creation page$/) do
  visit 'teams/new'
end

When(/^I fill the form with a valid Team$/) do
  team = attributes_for(:team)
  fill_in 'Nome', with: team[:name]
end

When(/^I try to access the team creation page$/) do
  visit 'teams/new'
end