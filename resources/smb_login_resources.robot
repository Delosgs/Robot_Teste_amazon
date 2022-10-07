*** Settings ***

Documentation    Arquivo principal do projeto de automação SMB
Library          SeleniumLibrary           
Resource         ../actions/LoginActions.robot

*** Variables ***
${BROWSER}                chrome 
${URL}                    https://loja-s.tray.com.br/adm/login.php?legacy=1
${MENU_TRAY}              //h2[@class='app-page-title'][contains(.,'Boa tarde, Teste da silva!')]
${LOGIN_ERRADO}           //p[contains(.,'Usuário e/ou senha inválidos. Tente novamente ou clique aqui e gere uma nova senha.')]


*** Keywords ***

Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot        login_SMB{index}.png
    Close Browser

Realizar Login
    [Arguments]      ${LOJA}        ${USUARIO}         ${SENHA}

    Dado que estou na home page do site Tray     
    Quando preencho as informações para login     ${LOJA}      ${USUARIO}       ${SENHA}
    E clico no botão entrar
    Então aparece o painel administrativo da Tray

   