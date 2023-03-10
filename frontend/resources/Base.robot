*** Settings ***

Documentation    Arquivo principal do projeto de automação SMB com Global Keywords

Library          SeleniumLibrary   


Resource         ../resources/Pages/Logins.robot


# Aqui é utilizado o conceito de herança, o arquivo Base herda todas as carateristas dos arquivos X e Y.
# Os arquivos Xe Y foram criados visando utilizar o conceito de encapsulamento.

*** Variables ***
${BROWSER}                googlechrome 
${URL_SMB}                https://loja-s.tray.com.br/adm/login.php?legacy=1
${MENU_TRAY}              //i[contains(@title,'Ver notificações')]
${LOGIN_ERRADO}           //p[contains(.,'Usuário e/ou senha inválidos. Tente novamente ou clique aqui e gere uma nova senha.')]
${SEM_DADOS_ACESSO}       //div[@class='ls-alert-success'][contains(.,'E-mail enviado com sucesso para a******************7@allin.com.br. Sendo o e-mail cadastrado em seu usuário.')]
${DELAY}                  2
${PROTEÇÃO_ROBO}          //p[contains(.,'Proteção contra robô. Autentique novamente.')]


*** Keywords ***


########## Aqui são as Keywords do Login ############


Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot        login_SMB{index}.png
    Close Browser

Realizar Login
    [Arguments]      ${LOJA}        ${USUARIO}         ${SENHA}

    Dado que estou na home page do site Tray     
    Quando preencho as informações para login                      ${LOJA}      ${USUARIO}       ${SENHA}
    E preencho as informações para login sem dados de acesso       ${LOJA}      ${USUARIO}
    E clico no botão entrar
    Então aparece o painel administrativo da Tray
