Feature: User Register Request
    The collaborator
    Wants to register and request its acceptance
    In order to access the system

    Scenario: User signs up and waits for acceptance
        Given I am on the user signup page
        When I fill the form with a valid user
        And I click the "Registrar" button
        Then I should see "Sucesso"
        And I should see "Aguarde a confirmação do seu cadastro"

    Scenario: User makes an invalid sign up
        Given I am on the user signup page
        When I fill the form with a valid user
        And I fill "johndoegmail.com" in "Email"
        And I fill "johndoegmail.com" in "Confirmação de Email"
        And I click the "Registrar" button
        Then I should see "Erro no cadastro!"
        And I should see "Email inválido"
