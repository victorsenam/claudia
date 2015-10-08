Given(/^I am on the user signup page$/) do
  visit '/users/new'
end

Given(/^I am at the login page$/) do
  visit '/sessions/new'
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

Given(/^I have a registered user$/) do
  @last_user = attributes_for(:user)
  create(:user, @last_user)
end

Given(/^I have a registered user with "(.*?)" as "(.*?)"$/) do |special_value, special_field|
  @last_user = attributes_for(:user, special_field.to_sym => special_value)
  create(:user, @last_user)
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

When(/^I fill that user's "(.*?)" in "(.*?)"$/) do |attribute, field|
  val = @last_user[attribute.to_sym]
  fill_in field, with: val
end

Given(/^I am logged in with "(.*?)" as "(.*?)"$/) do |val, attr|
  @last_user = attributes_for(:user, attr.to_sym => val)
  create(:user, @last_user)

  visit '/sessions/new'

  fill_in 'Email', with: @last_user[:email]
  fill_in 'Senha', with: @last_user[:password]
  find( 'Enviar' ).click
end

Given(/^I have a valid user session$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have a valid admin session$/) do
  pending # express the regexp above with the code you wish you had
end

