Feature: Team creation
    An administrator wants to create a new team
    and assign existing users to it

    Scenario: Administrator creates a new empty team
        Given I have a registered user
        And That user's "rank" is "6"
        And I am logged in as that user
        And I am at the team creation page
        When I fill the form with a valid Team
        And I click the "Create" button
	    Then I should see "Equipe pronta para receber usuários."

    Scenario: Administrator tries to create unnamed team
        Given I have a registered user
        And That user's "rank" is "6"
        And I am logged in as that user
        And I am at the team creation page
        When I click the "Create" button
        Then I should see "Denomine a nova equipe."

    Scenario: Ordinary user tries to access the team creation page
        Given I have a registered user
        And That user's "rank" is "1"
        And I am logged in as that user
        When I try to access the team creation page
        Then I should see "Usuários comuns não podem criar uma equipe."

    Scenario: Unregistered user tries to access the team creation page
        When I try to access the team creation page
        Then I should see "Somente usuários registrados podem acessar esta página." 
