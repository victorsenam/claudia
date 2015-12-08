Feature: Assign Team to Event
  The admin
  Wants to assign teams to events
  In order to provide access from the team to the event

  Scenario: Admin assigns team to event
    Given I have a registered user
    And That user is an "ADMIN"
    And I have a registered team
    And I have a registered event
    When I visit that event's edit page
    And I click on the "Times" button
    And I select that team
    And I click the "Salvar" button
    Then That team should be assigned to that event

  Scenario: Assigned users should be able to see the event
    Given I have a registered user
    And That user in an "ACCEPTED"
    And I have a registered team
    And I have a registered event
    And That user is assigned to that team
    And That team is assigned to that event
    And I am logged in as that user
    When I visit the event list page
    Then I should see that event's name
    When I visit that event's show page
    Then I should see that event's name
