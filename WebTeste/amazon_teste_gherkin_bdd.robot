*** Settings ***

Documentation     Essa suite testa o site da Amazon.com.br pelo QA Delano
Resource          amazon_resources.robot
Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador


*** Test Cases ***

Caso de Teste 01 - Acesso ao menu "Eletrônicos"
    [Documentation]     Este teste verifica o menu eletrônicos do site da amazon.com.br
    ...                 e verifica a categoria Tablets
    [Tags]              menus_categorias

   Dado que estou na home page da Amazon.com.br
   Quando acessar o menu "Eletrônicos"
   Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
   E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
   E a categoria "Computadores e Informática" deve ser exibida na página


Caso de Teste 02 - Pesquisa de um Produto pelo 
    [Documentation]     Este teste verifica a busca de um produto
    [Tags]              busca_produtos   lista_busca
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então um produto da linha "Xbox Series S" deve ser mostrado na página
    