Given(/^I am on the user signup page$/) do
  visit '/users/new'
end

When(/^I select that user$/) do
  find("input[type='checkbox'][value='#{@last_user.id}']").set(true)
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
  user = attributes_for(:user)
  @last_user_pass = user[:password]
  @last_user = create(:user, user)
end

Given(/^That user's "(.*?)" is "(.*?)"$/) do |attr, value|
  @last_user = user.update_attribute(attr.to_sym, value)
end

Given(/^That user is an? "(.*?)"$/) do |role|
  @last_user.update_attribute(:rank, User.const_get(role))
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

When(/^I fill that user's password in "(.*?)"$/) do |field|
  val = @last_user_pass
  fill_in field, with: val
end

Given(/^I am logged in as that user$/) do
  visit '/sessions/new'

  fill_in 'Email', with: @last_user.email
  fill_in 'Senha', with: @last_user_pass
  find( '[value=Entrar]' ).click
end

When(/^I try to access the edit page$/) do
  visit '/users/edit'
end

Then(/^The email field should have that user's email$/) do
  expect( find_field('user[email]').value ).to eq(@last_user.email)
end

When(/^I access the users listing page$/) do
  visit '/users/'
end

When(/^I try to access the users listing page$/) do
  visit '/users/'
end

When(/^I select "(.*?)" for that user$/) do |value|
  select value, from: "rank[#{@last_user.id}]"
end

Then(/^That user should be an "(.*?)"$/) do |rank|
  user = User.find(@last_user.id)
  expect( user.rank ).to eq( User.const_get(rank) )
end
