*** Settings ***

Documentation     Essa suite testa a tela de login do SMB pelo QA Delano
Resource          ../resources/Base.robot

Test Setup        Abrir o navegador
Test Teardown     Fechar o navegador


*** Test Cases ***

Login Com Sucesso    
    [Tags]    LGN01
    
    Dado que estou na home page do site Tray        
    Quando preencho as informações para login    1079359    123qweqwe    Beta123@SMB*f#QA
    E clico no botão entrar
    Então aparece o painel administrativo da Tray
    Então Eu Faço Logout
    [Teardown]        Fechar o navegador

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
    Quando preencho as informações para login    1079359     Erro_Usuario     Beta123@SMB*f#QA
    E clico no botão entrar
    Então aparece a mensagem de usuario ou senha errados

Usuario Em Branco
    [Tags]    LGN05

    Dado que estou na home page do site Tray        
    Quando preencho as informações para login    1079359     ${EMPTY}     Beta123@SMB*f#QA
    E clico no botão entrar
    Então aparece a mensagem de proteção contra robo

Sem Dados De Acesso
    [Tags]    LGN06
    Dado que estou na home page do site Tray 
    E não lembro meu login
    E Clico Em Esqueci Meus Dados De Acesso 
    E preencho as informações para login sem dados de acesso        1079359       123qweqwe    
    Então Devo clicar enviar senha por email
    [Teardown]        Fechar o navegador