*** Settings ***

Documentation     Essa suite testa a tela de login do SMB pelo QA Delano
Resource          ../actions/LoginActions.robot
Resource          ../resources/smb_login_resources.robot

Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador


*** Test Cases ***

Login Com Sucesso    
    [Tags]    LGN01
    
    Dado que estou na home page do site Tray        
    Quando preencho as informações para login    1079359    123qweqwe    esT6nq63*f#QA
    E clico no botão entrar
    Então aparece o painel administrativo da Tray
    [Teardown]    Então Eu Faço Logout

Senha Em Branco
    [Tags]    LGN02
    
    Dado que estou na home page do site Tray        
    Quando preencho as informações para login    1079359     123qweqwe     ${EMPTY}
    E clico no botão entrar
    Então aparece a mensagem de usuario ou senha errados

Senha Incorreta
    [Tags]    LGN03

    Dado que estou na home page do site Tray        
    Quando preencho as informações para login    1079359     123qweqwe     Senha_errada#QA
    E clico no botão entrar
    Então aparece a mensagem de usuario ou senha errados

Usuario Incorreto
    [Tags]    LGN04

    Dado que estou na home page do site Tray        
    Quando preencho as informações para login    1079359     Erro_Usuario     esT6nq63*f#QA
    E clico no botão entrar
    Então aparece a mensagem de usuario ou senha errados

Usuario Em Branco
    [Tags]    LGN05

    Dado que estou na home page do site Tray        
    Quando preencho as informações para login    1079359     ${EMPTY}     esT6nq63*f#QA
    E clico no botão entrar
    Então aparece a mensagem de usuario ou senha errados
