*** Settings ***
Documentation         Aqui estão as keywords dos testes de cadastro

Resource            ../config/package.robot

*** Keywords ***
##############################################################################
#          Cenario: Validando cadastro com sucesso no learningprime          #
##############################################################################
Dado que eu esteja na tela de cadastro
    Wait Until Element Is Visible    xpath=//a[@href='/login']
    Click Element                    xpath=//a[@href='/login']

    Wait Until Element Is Visible    xpath=//a[@href='/signup']
    Click Element                    xpath=//a[@href='/signup']

    Wait Until Page Contains         Novo Cliente

E informe todos os dados necessários
    ${EMAIL_FAKER}                   FakerLibrary.Email 
    Input Text                       id=spree_user_email                    ${EMAIL_FAKER}
    Input Text                       id=spree_user_password                 123456789
    Input Text                       id=spree_user_password_confirmation    123456789

Quando finalizar o cadastro
    Click Element                    xpath=//input[@value="Criar" and @type="submit"]

Então devo ser direcionado para a tela home do site
    Wait Until Element Is Visible    xpath=//a[@href='/account']