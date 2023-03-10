*** Settings ***

Documentation    Keywords
Resource   ../Base.resource


*** Keywords ***


Esperar e clicar
    [Arguments]    ${element}
    Wait For Elements State    ${element}
    Click    ${element}

E visualizo um produto
    Click    (//a[@href='https://123qweqwe-1079359.commercesuite.com.br/racao'][contains(.,'Ração')])[1]
    Wait For Elements State    //a[contains(@itemprop,'url')]    visible    ${Timeout}
    Click    //a[contains(@itemprop,'url')]

Quando clico em "comprar"
    Sleep    2
    Wait For Elements State    //span[@class='botao-commerce-img'][contains(.,'Comprar')]    visible    ${Timeout}
    Click    //span[@class='botao-commerce-img'][contains(.,'Comprar')]
E Avanço para finalizar o pedido
    Wait For Elements State    //span[@class='botao-commerce-img'][contains(.,'Avançar')]    visible    ${Timeout}
    Click    //span[@class='botao-commerce-img'][contains(.,'Avançar')]
Então o comportamento de carrinho é captado com sucesso
    Wait For Response    ${RESPONSE_BETA} 
E realizo o login
    [Arguments]    ${login}    ${senha}
    Click    //a[contains(.,'Minha Conta')]
    Wait For Elements State    //button[@class='app__button--primary app__login__button app__login__button--login'][contains(.,'Entrar')]    visible    ${Timeout}
    Click    //button[@class='app__button--primary app__login__button app__login__button--login'][contains(.,'Entrar')]
    Wait For Elements State    //strong[@class='tray-title tray-login__title'][contains(.,'Identifique-se')]    visible    ${Timeout}
    Fill Text    //input[contains(@autocapitalize,'off')]    ${login}
    Click    //button[@type='submit'][contains(.,'Continuar')]
    Wait For Elements State    //input[contains(@type,'password')]    visible    ${Timeout}
    Fill Text    //input[contains(@type,'password')]    ${senha}
    Click    //button[@type='submit'][contains(.,'Continuar')]
    Wait For Elements State    //a[contains(@class,'app__button app__button--primary app__button--no-margin')]   visible    ${Timeout}
    Click    //h1[@class='app__header__title'][contains(.,'´!¹²³$£¢¬¬..§ø123qweQWE;?')]
    Wait For Elements State    //a[contains(.,'Sair')]
#Então o comportamento é captado com sucesso
    #Wait For Response    