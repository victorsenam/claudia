Feature: Users Listing
    The administrator
    Wants to update permissions and access information
    In order to manage users

    Scenario: Unlogged user should not see users
        When I try to access the users list
        Then I should see "Por favor, faça o login"

    Scenario: Ordinary user should not see users
        Given this test is pending

    Scenario: Administrator should see all users
        Given this test is pending

    Scenario: Administrator should be able to access specific user info
        Given this test is pending

    Scenario: Administrator shoud not see private information
        Given this test is pending
