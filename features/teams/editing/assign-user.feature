Feature: Assign User to Team
  The admin
  Wants to assign users to a team
  In order to group them

  Scenario: Admin assigns users to team
    Given I have a registered user
    And That user is an "ADMIN"
    And I am logged in as that user
    And I have a registered user
    And I have a registered user
    And I have a registered team
    When I access that team's edition page
    And I select that user
    And I click the "Salvar" button
    Then That user should be assigned to that team

  Scenario: Users sees teams he's assigned to
    Given I have a registered user
    And That user is an "ACCEPTED"
    And I have a registered team
    And That user is assigned to that team
    And I am logged in as that user
    When I access the team list page
    Then I should see that team's name

