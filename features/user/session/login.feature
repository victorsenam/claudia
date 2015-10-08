Feature: User Login
    The User
    Wants to login on the system
    In order to access info that is important to him

    Scenario: A valid user should be able to log in
        Given I have a registered user with "1" as "rank"
        And I am at the login page
        When I fill that user's "password" in "Senha"
        And I fill that user's "email" in "Email"
        And I click the "Entrar" button
        Then I should see "Logado com Sucesso!"

    Scenario: A pending user should not be able to log in
        Given I have a registered user with "0" as "rank"
        And I am at the login page
        When I fill that user's "password" in "Senha"
        And I fill that user's "email" in "Email"
        And I click the "Entrar" button
        Then I should see "Usuário Pendente"

    Scenario: An unexistant user should not be able to log in
        Given I am at the login page
        When I fill "pedronepo@example.com" in "Email"
        And I fill "umasenha" in "Senha"
        And I click the "Entrar" button
        Then I should see "Usuário Inválido"

    Scenario: I should not be able to login with a wrong password
        Given I have a registered user with "1" as "rank"
        And I am at the login page
        When I fill that user's "email" in "Email"
        And I fill "senhaqueelenaovaiter" in "Senha"
        And I click the "Entrar" button
        Then I should see "Senha Inválida"
