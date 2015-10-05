@wip
Feature: User Register Request
The collaborator
Wants to register and request its acceptance
In order to access the system

    Scenario: User signs up and waits for acceptance
        Given I am on the user signup page
        When I fill the "Email" field with "johndoe@example.com"
        And I fill the "Nome" filed with "John Doe"
        And I click the "Registrar" button
        Then I should see "Sucesso"
        And I should see "Aguarde a confirmação do seu cadastro"
    
    Scenario: User signs in with an invalid email
        Given I am on the user signup page
        When I fill the "Email" field with "johndoenotanemail"
        And I fill the "Nome" field with "John Doe"
        And I click the "Registrar" button
        Then I should see "Erro"
        And I should see "email inválido"

    Scenario: User signs in with no name
        Given I am on the user signup page
        When I fill the "Email" field with "johndoe@example.com"
        And I click the "Registrar" button
        Then I should see "Erro"
        And I should see "nome vazio"
