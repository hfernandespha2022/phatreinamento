*** Settings ***
Documentation        Aqui estarão os Setups e os Teardowns do projeto.

Resource            ../config/package.robot

*** Variables ***
${URL}         https://learningprime.com.br/
${BROWSER}     chrome

*** Keywords ***
Abrir o meu navegador
    Open Browser                     ${URL}    ${BROWSER}
    Set Selenium Implicit Wait       30
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot
    Close Browser