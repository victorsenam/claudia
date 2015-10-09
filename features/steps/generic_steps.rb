When(/^I fill "(.*?)" in "(.*?)"$/) do |value, field|
    fill_in field, with: value
end

When(/^I click on "(.*?)"$/) do |text|
    find( text ).click
end

When(/^I click the "(.*?)" button$/) do |button_name|
    click_button button_name
end

Then(/^I should see "(.*?)"$/) do |text|
    expect( page ).to have_content( text )
end

Then(/^I should not see "(.*?)"$/) do |text|
    expect( page ).not_to have_content( text )
end

Given(/^I am at the root page$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have a valid user session$/) do
  user_attr = attributes_for(:user)
  user = create(:user, user_attr)
  user.rank = user_attr[:rank] = User::ACCEPTED
  user.save!

  visit '/sessions/new'

  fill_in 'Email', with: user_attr[:email]
  fill_in 'Senha', with: user_attr[:password]
  find('[value=Entrar]').click
end

Given(/^I have a valid admin session$/) do
  user_attr = attributes_for(:user)
  user = create(:user,user_attr)
  user.rank = user_attr[:rank] = User::ADMIN
  user.save!

  visit '/sessions/new'

  fill_in 'Email', with: user_attr[:email]
  fill_in 'Senha', with: user_attr[:password]
  find('[value=Entrar]').click
end
