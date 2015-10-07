Feature: Users Listing
    The administrator
    Wants to update permissions and access information
    In order to manage users

    Scenario: Unlogged user should not see users
        When I try to access the users list
        Then I should see "Por favor, faça o login"

    Scenario: Ordinary user should not see users
        Given I have a registered user
        And I have a valid user session
        When I try to access the users list
        Then I should see "Que pena, você não pode acessar essa página"

    Scenario: Administrator should see all users
        Given I have a registered user
        And I have a valid admin session
        When I try to access the users list
        Then I should see every user's "name"
        And I should see every user's "email"

    Scenario: Administrator should be able to access specific user info
        Given I have a registered user with "Nathan" as "name"
        And I have a valid admin session
        And I am on the users list page
        When I click on "Nathan"
        Then I should see info for "Nathan"

    Scenario: Administrator shoud not see private information
        Given I have a registered user with "senha muito boba" as "password"
        And I have a valid admin session
        And I am on the users list page
        Then I should not see "senha muito boba"
