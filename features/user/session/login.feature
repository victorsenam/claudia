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

    Scenario: An invalid login should fail
        Given I am at the login page
        When I fill "pedronepo@example.com" in "Email"
        And I fill "umasenha" in "Senha"
        And I click the "Entrar" button
        Then I should see "Falha"

    Scenario: I should be able to logout
        Given I have a registered user
        And I have a valid user session
        And I am at the root
        When I click on "Logout"
        Then I should see "Login"
