*** Settings ***
Library              SeleniumLibrary
Documentation        Login Actions do SMB       

*** Variables ***

${URL}                    https://loja-s.tray.com.br/adm/login.php?legacy=1
${LOGIN_ERRADO}           //p[contains(.,'Usuário e/ou senha inválidos. Tente novamente ou clique aqui e gere uma nova senha.')]
${MENU_TRAY}              //h2[@class='app-page-title'][contains(.,'Boa tarde, Teste da silva!')]

*** Keywords ***
Dado que estou na home page do site Tray
    Go To    url=${URL} 
Quando preencho as informações para login
    [Arguments]    ${LOJA}      ${USUARIO}       ${SENHA}

    Input Text    locator=loja    text= ${LOJA} 
    Sleep    2s
    Input Text    locator=usuario    text=${USUARIO}
    Sleep    2s
    Input Text    locator=senha   text=${SENHA}
    Sleep    1s
E clico no botão entrar
    Click Element    locator=btn-submit
Então aparece o painel administrativo da Tray
    Sleep     6s
    Wait Until Element Is Visible    locator=${MENU_TRAY}

Então aparece a mensagem de usuario ou senha errados
    Sleep     5s
    Wait Until Element Is Visible    locator=${LOGIN_ERRADO} 

Então Eu Faço Logout
    Click Element    //span[@class='nav-user__profile-username'][contains(.,'Teste da silva')]
    Wait Until Element Is Visible    //span[@class='nav-user__title'][contains(.,'Sair')]
    Click Element    //a[@role='menuitem'][contains(.,'Sair')]