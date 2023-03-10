*** Settings ***
Documentation    Global Keywords

Library      Browser
Resource     ../Resources/Pages/HomeSite.resource
# Aqui é utilizado o conceito de herança, o arquivo Base herda todas as carateristas dos arquivos X e Y.
# Os arquivos X e Y foram criados visando utilizar o conceito de encapsulamento.

*** Variables ***
${URL}                    https://123qweqwe-1079359.commercesuite.com.br/
${RESPONSE_BETA}          https://beta-wonka.socialminer.com/ursa/enterprise/behaviors
${Timeout}                10

*** Keywords ***

Iniciar Sessão
    New Browser           chromium    false    slowMo=0:00:01
Finalizar Teste
    Take Screenshot

Dado que estou no site da loja
    New Page              ${URL}