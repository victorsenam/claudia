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

    Scenario: User signs in with an invalid email
        Given I am on the user signup page
        When I fill the form with a valid user
        And I fill "johndoegmail.com" in "Email"
        And I fill "johndoegmail.com" in "Confirmação de Email"
        And I click the "Registrar" button
        Then I should see "Erro no cadastro!"
        And I should see "Email inválido"

    Scenario: User signs in with no name
        Given I am on the user signup page
        When I fill the form with a valid user
        And I fill "" in "Nome"
        And I click the "Registrar" button
        Then I should see "Erro no cadastro!"
        And I should see "Nome vazio"

    Scenario: User misses mail confirmation
        Given I am on the user signup page
        When I fill the form with a valid user
        And I fill "outroemail@gmail.com" in "Email"
        And I click the "Registrar" button
        Then I should see "Erro no cadastro!"
        And I should see "A Confirmação do Email está errada."

    Scenario: User misses password confirmation
        Given I am on the user signup page
        When I fill the form with a valid user
        And I fill "umaoutrasenhasenha segura e arbritaria (sem acento)" in "Confirmação de Senha"
        And I click the "Registrar" button
        Then I should see "Erro no cadastro!"
        And I should see "A Confirmação de Senha está errada."

    Scenario: User inputs small password
        Given I am on the user signup page
        When I fill the form with a valid user
        And I fill "senha" in "Senha"
        And I click the "Registrar" button
        Then I should see "Erro no cadastro!"
        And I should see "A senha deve ter pelo menos 6 caracteres."

    Scenario: Email already used
        Given There's a registered user with "johndoe@example.com" as "email"
        And I am on the user signup page
        When I fill the form with a valid user
        And I click the "Registrar" button
        Then I should see "Erro no cadastro!"
        And I should see "Esse email já foi cadastrado :("
