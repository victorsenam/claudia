Feature: Users Listing
  The administrator
  Wants to update permissions and access information
  In order to manage users

  Scenario: The admin should be able to change users status
    Given I have a registered user
    And That user is an "ADMIN"
    And I am logged in as that user
    And I have a registered user
    And That user is a "PENDING"
    When I access the users listing page
    And I select "Aceito" for that user
    And I click the "Salvar" button
    Then That user should be an "ACCEPTED"

  Scenario: Regular users should not be able to access this page
    Given I have a registered user
    And That user is an "ACCEPTED"
    And I am logged in as that user
    When I try to access the users listing page
    Then I should see "Deve ser admin"
