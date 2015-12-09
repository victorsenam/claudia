Feature: Event Creation
  The Admin
  Wants to create events
  In order to organize important information about them

  Scenario: Creating a Valid Event
    Given I have a registered user
    And That user is an "ADMIN"
    And I am logged in as that user
    When I access the event creation page
    And I fill the form with a valid event
    And I click the "Salvar" button
    Then I should see "Evento Criado"

  Scenario: Failing to Create an Event
    Given I have a registered user
    And That user is an "ADMIN"
    And I am logged in as that user
    When I access the event creation page
    And I fill the form with a valid event
    And I fill "" in "Nome"
    And I click the "Salvar" button
    Then I should see "Erro"

  Scenario: Regular User trying to create Event
    Given I have a registered user
    And That user is an "ACCEPTED"
    And I am logged in as that user
    When I try to access the event creation page
    Then I should see "Deve ser admin"
