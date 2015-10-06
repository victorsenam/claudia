Feature: User Register Request
    The collaborator
    Wants to register and request its acceptance
    In order to access the system

    Scenario: User signs up and waits for acceptance
        Given I am on the user signup page
        When I fill "johndoe@example.com" in "Email"
        And I fill "johndoe@example.com" in "Confirmação de Email"
        And I fill "John Doe" in "Nome"
        And I fill "senha segura" in "Senha"
        And I fill "senha segura" in "Confirmação de Senha"
        And I click the "Registrar" button
        Then I should see "Sucesso"
        And I should see "Aguarde a confirmação do seu cadastro"

    Scenario: User signs in with an invalid email
        Given I am on the user signup page
        When I fill "johndoenotanemail" in "Email"
        And I fill "johndoenotanemail" in "Confirmação de Email"
        And I fill "John Doe" in "Nome"
        And I fill "senha segura" in "Senha"
        And I fill "senha segura" in "Confirmação de Senha"
        And I click the "Registrar" button
        Then I should see "Erro no cadastro!"
        And I should see "Email inválido"

    Scenario: User signs in with no name
        Given I am on the user signup page
        When I fill "johndoe@example.com" in "Email"
        And I fill "johndoe@example.com" in "Confirmação de Email"
        And I fill "senha segura" in "Senha"
        And I fill "senha segura" in "Confirmação de Senha"
        And I click the "Registrar" button
        Then I should see "Erro no cadastro!"
        And I should see "Nome vazio"

    Scenario: User misses mail confirmation
        Given I am on the user signup page
        When I fill "johndoe@example.com" in "Email"
        And I fill "jackdoe@example.com" in "Confirmação de Email"
        And I fill "senha segura" in "Senha"
        And I fill "senha segura" in "Confirmação de Senha"
        And I click the "Registrar" button
        Then I should see "Erro no cadastro!"
        And I should see "Confirmação do Email errada"

    Scenario: User misses password confirmation
        Given I am on the user signup page
        When I fill "johndoe@example.com" in "Email"
        And I fill "johndoe@example.com" in "Email"
        And I fill "senha segura" in "Senha"
        And I fill "senha mais segura" in "Confirmação de Senha"
        And I click the "Registrar" button
        Then I should see "Erro no cadastro!"
        And I should see "Confirmação de Senah errada"

    Scenario: User inputs small password
        Given I am on the user signup page
        When I fill "johndoe@example.com" in "Email"
        And I fill "johndoe@example.com" in "Email"
        And I fill "senha" in "Senha"
        And I fill "senha" in "Confirmação de Senha"
        And I click the "Registrar" button
        Then I should see "Erro no cadastro!"
        And I should see "A senha deve ter pelo menos 8 caracteres"
