*** Settings ***
Library        SeleniumLibrary
# Aqui eu posso chamar outros resources EX:
# Resource    BDD_Gherkin


*** Variables ***
${BROWSER}                chrome 
${URL}                    http://www.amazon.com.br
${MENU_ELETRONICOS}       //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}     //h1[contains(.,'Eletrônicos e Tecnologia')]


*** Keywords ***

Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window    


Fechar o navegador
    Capture Page Screenshot    #QA_Delano=selenium-screenshot-{index}.png
    Close Browser

Acessar a home page do site Amazon.com.br   #Essa keyword só é escrita uma vez mas roda duas vezes
    Go To    url=${URL} 
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS} 


Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}


Verificar se aparece a frase "${FRASE}" 
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
    # ${FRASE} = Eletrônicos e Tecnologia 

Verificar se o título da página fica "${TITULO}"  # Essa keyword roda duas vezes no teste
    Title Should Be    title=${TITULO}
    # ${TITULO} = Eletrônicos e Tecnologia | Amazon.com.br

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//a[contains(@aria-label,'${NOME_CATEGORIA}')]

 
 # Aqui começa o segundo caso de teste

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}    # Xbox Series S
    # twotabsearchtextbox = Id da pagina 
    # text=${PRODUTO} = O produto que vai ser digitado no input que vem do teste case      

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button       
    # nav-search-submit-button = Id da pagina

Verificar o resultado da pesquisa, listando o produto "${PRODUTO}" 
    Wait Until Element Is Visible    locator=(//span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'${PRODUTO}')])[1]                                               
    # ${PRODUTO} = Console Xbox Series S

# GHERKIN STEPS 01
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"
Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Tablets"

# GHERKIN STEPS 02
Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa 

Então um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, listando o produto "Console Xbox Series S"

   