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

Given(/^That user's "(.*?)" is "(.*?)"$/) do |attr, value|
  user = User.find_by_id(@last_user[:id])
  user.update_attribute(attr.to_sym, value)
  @last_user[attr.to_sym] = value
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

Given(/^I am logged in as that user$/) do
  visit '/sessions/new'

  fill_in 'Email', with: @last_user[:email]
  fill_in 'Senha', with: @last_user[:password]
  find( '[value=Entrar]' ).click
end

When(/^I try to access the edit page$/) do
  visit '/users/edit'
end

Then(/^The email field should have that user's email$/) do
  expect( find_field('user[email]').value ).to eq(@last_user[:email])
end

