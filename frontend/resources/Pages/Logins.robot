*** Settings ***

Documentation        Login Actions do SMB       


*** Keywords ***


Dado que estou na home page do site Tray
    Go To    url=${URL_SMB} 
Quando preencho as informações para login
    [Arguments]    ${LOJA}      ${USUARIO}       ${SENHA}

    Input Text    locator=loja       text= ${LOJA}         
    Sleep    2s
    Input Text    locator=usuario    text=${USUARIO}       
    Sleep    1s
    Input Text    locator=senha      text=${SENHA}         
    #Sleep    1s
    Set Selenium Speed      ${DELAY}


E preencho as informações para login sem dados de acesso
    [Arguments]    ${LOJA}      ${USUARIO}       

    Input Text    locator=loja    text= ${LOJA} 
    Sleep    1s
    Input Text    locator=usuario    text=${USUARIO}
    Sleep    1s

E clico no botão entrar
    Click Element    locator=btn-submit

E não lembro meu login 
    Input Text    locator=loja       text= ${EMPTY} 
    Input Text    locator=usuario    text= ${EMPTY} 
    Input Text    locator=senha      text= ${EMPTY} 

E Clico Em Esqueci Meus Dados De Acesso
    Click Element    //a[contains(.,'Esqueci meus dados de acesso')]

Então aparece o painel administrativo da Tray
    Sleep     2s                                        
    Wait Until Element Is Visible    locator=${MENU_TRAY}      
    #Set Selenium Speed      ${DELAY}

Então aparece a mensagem de usuario ou senha errados
    Sleep     3s
    Wait Until Element Is Visible    locator=${LOGIN_ERRADO}

Então aparece a mensagem de proteção contra robo
    Sleep     3s
    Wait Until Element Is Visible    locator=${PROTEÇÃO_ROBO}

Então Devo Preencher Loja e Usuario
    Wait Until Element Is Visible    locator=//div[contains(@class,'ls-alert-success')]

Então Devo clicar enviar senha por email
    Click Element    id=submit
    Wait Until Element Is Visible    ${SEM_DADOS_ACESSO}

Então Eu Faço Logout
    Click Element    //span[@class='nav-user__profile-username'][contains(.,'Teste da silva')]
    Wait Until Element Is Visible    //span[@class='nav-user__title'][contains(.,'Sair')]
    Click Element    //a[@role='menuitem'][contains(.,'Sair')]