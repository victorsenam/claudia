Feature: Team Creation
  The admin
  Wants to create teams
  In order to group users

  Scenario: Admin creates valid team
    Given I have a registered user
    And That user is an "ADMIN"
    And I am logged in as that user
    When I access the team creation page
    And I fill the form with a valid team
    And I click the "Salvar" button
    Then I should see "Sucesso"

  Scenario: Regular users should not be able to access this page
    Given I have a registered user
    And That user is an "ACCEPTED"
    And I am logged in as that user
    When I try to access the team creation page
    Then I should see "Deve ser admin"
