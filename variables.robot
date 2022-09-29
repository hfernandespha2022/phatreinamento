*** Settings ***
Documentation        Aqui neste arquivo estaram presentes todos os tipos de 
...                  variáveis que iremos estudar ao longo do treinamento.

Library              SeleniumLibrary

Test Setup           Abrir o meu navegador
Test Teardown        Fechar navegador

*** Variables ***
#Variável do tipo Simples
${NOME}        HELDER FERNANDES DE PAULA

#Variável do tipo Lista
@{FRUTAS}      Banana    Maçã    Melância    Abacaxi

#Variável do tipo dicionário
&{CARRO_MODELO}        
...            Marca=Nissan    
...            Cor=Preto    
...            Modelo=Sentra SL    
...            Ano=2016

${URL}         https://robotframework.org/
${BROWSER}     chrome

*** Test Cases ***
Cenario: Buscando um roupa
    Dado que eu esteja na tela Home do site
    Quando pesquisar o produto 
    Então o produto deve ser apresentado com sucesso

Validar abertura do Browser
    [Tags]        BROWSER
    Abrir o meu navegador
    Fechar navegador

Validar abertura do Facebook
    [Tags]        FACEBOOK
    Abrir o meu navegador
    Fechar navegador

Validar soma de dois números
    [Tags]        SOMA
    Somar dois números    587    1234
    Somar o "464" mais o "464"

*** Keywords ***
Dado que eu esteja na tela Home do site
    

Quando pesquisar o produto 


Então o produto deve ser apresentado com sucesso

Abrir o meu navegador
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser

Somar dois números
    [Arguments]        ${NUM_A}    ${NUM_B}
    ${SOMA}        Evaluate    ${NUM_A}+${NUM_B}
    Log To Console    \n${SOMA}

Somar o "${NUM_A}" mais o "${NUM_B}"
    ${SOMA}        Evaluate    ${NUM_A}+${NUM_B}
    Log To Console    \n${SOMA}


