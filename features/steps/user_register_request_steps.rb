Given(/^I am on the user signup page$/) do
  visit '/users/new'
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

