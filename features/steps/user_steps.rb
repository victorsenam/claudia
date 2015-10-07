Given(/^I am on the user signup page$/) do
  visit '/users/new'
end

When(/^I try to access the users list$/) do
  visit '/users'
end

Given(/^I am on the users list page$/) do
  visit '/users'
end

When(/^I fill the form with a valid user$/) do
  user = build(:user)

  fill_in 'Nome', with: user.name
  fill_in 'Email', with: user.email
  fill_in 'Confirmação de Email', with: user.email
  fill_in 'Senha', with: user.password
  fill_in 'Confirmação de Senha', with: user.password
end

Given(/^I have a registered user with "(.*?)" as "(.*?)"$/) do |special_value, special_field|
  user = create(:user, special_field.to_sym => special_value)
end

Given(/^I have a registered user$/) do
  create(:user)
end

Given(/^I have a valid user session$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have a valid admin session$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should see every user's "(.*?)"$/) do |attr|
  users = User.all

  users.each do |user|
    expect( page ).to have_content (user.send(attr.to_sym))
  end
end

Then(/^I should see info for user "(.*?)"$/) do |user_name|
  user = User.find(name: user_name)

  expect( page ).to have_content user.name
  expect( page ).to have_content user.email
end

