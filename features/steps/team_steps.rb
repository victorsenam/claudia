When(/^I(?: try to|) access the team creation page$/) do
  visit 'teams/new'
end

When(/^I fill the form with a valid team$/) do
  team = attributes_for(:team)
  fill_in 'Nome', with: team[:name]
end

Given(/^I have a registered team$/) do
  @last_team = create(:team)
end

When(/^I access that team's edition page$/) do
  visit "/teams/#{@last_team.id}/edit"
end

When(/^I select that user$/) do
  find("input[type='checkbox'][value='#{@last_user.id}']").set(true)
end

Then(/^That user should be assigned to that team$/) do
  expect(@last_user.teams.all).to include(@last_team)
end

Given(/^That user is assigned to that team$/) do
  @last_team.users << @last_user
end

When(/^I access the team list page$/) do
  visit '/teams/'
end

Then(/^I should see that team's name$/) do
  find(@last_team.name)
end
