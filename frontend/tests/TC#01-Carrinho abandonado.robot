*** Settings ***
Documentation        Validação do Login.

Resource             ../Resources/Base.resource

Test Setup       Iniciar Sessão
Test Teardown    Finalizar Teste

*** Test Cases ***
Login com sucesso
    [Tags]    CA01
    Dado que estou no site da loja
    E realizo o login    augusto.santos@allin.com.br   testedaSilva#03
    
Comprar um produto
    [Tags]    CA02
    Dado que estou no site da loja
    E realizo o login    augusto.santos@allin.com.br   testedaSilva#03
    E visualizo um produto
    Quando clico em "comprar"
    E Avanço para finalizar o pedido
    Então o comportamento de carrinho é captado com sucesso