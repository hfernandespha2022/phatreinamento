*** Settings ***
Documentation        Aqui estão as keywords do testes de busca.

Resource            ../config/package.robot

*** Keywords ***
##############################################################################
#                       Cenario: Buscar Mug com sucesso                      #
##############################################################################
Então o teste é concluído com sucesso
    Page Should Contain Image       ${HOME.IMG_MUG}

E a seguinte mensagem deve ser apresentada
    [Arguments]                      ${MESSAGE}
    Wait Until Page Contains         ${MESSAGE}

Dado que eu esteja na tela Home do site
    Title Should Be                  Learning Prime Store
    Wait Until Page Contains         Comprar por Categories

Quando pesquisar o produto
    [Arguments]                      ${PRODUTO}
    Input Text                       ${HOME.INPUT_BUSCA}     ${PRODUTO}
    Click Element                    ${HOME.BTN_BUSCAR}

Então o produto deve ser apresentado com sucesso
    Wait Until Page Contains         Resultados da busca por 'Bag'
    Page Should Contain Image        ${HOME.IMG_BAG}