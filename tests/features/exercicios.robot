*** Settings ***
Documentation        Neste arquivo estarão presentes todos os exercicios de IF e FOR.


*** Variables ***
${SIMPLES}
@{LISTA}
&{DICIONARIO}

${NOME}        Helder

*** Test Cases ***
Contando de 0 a 9
    [Tags]        CONTAR
    Contar de 0 a 9

Contando a lista de FRUTAS
    [Tags]        FRUTA
    Percorrer itens de uma Lista

Exercicio do FOR
    [Tags]        EXEC
    Exercicio do FOR

Imprimindo os paises
    [Tags]        PAISES
    Imprimir lista de paises

Imprimindo o nome por decisão
    [Tags]        DECISAO
    Exercicio do IF

Gerando um email com argumentos
    [Tags]           EMAIL
    Criando email    Helder    Fernandes    28

*** Keywords ***
Contar de 0 a 9
    FOR   ${count}  IN RANGE  0   10
        Log To Console    ${count}
    END

Percorrer itens de uma Lista
    @{FRUTAS}    Create List        Morango    Banana    Abacaxi    Uva    Melância
    FOR   ${FRUTA}  IN   @{FRUTAS}
        Log To Console    ${FRUTA}
    END

Exercicio do FOR
    FOR  ${COUNT}    IN RANGE    0  11
        Log To Console    Estou no número: ${COUNT}
    END

Imprimir lista de paises
    @{PAISES}       Create List    USA    HOLANDA    MEXICO    ARGENTINA    JAPÃO
    FOR  ${PAIS}    IN     @{PAISES}
        Log To Console    Eu vou conhecer o ${PAIS}
    END

Tomar decisões
    IF    '${NOME}'=='Maria'
        Log To Console    Vou fazer isso só quando for a maria
    ELSE IF  '${NOME}'=='João'
        Log To Console    Vou fazer isso só quando for a João
    ELSE
        Log To Console    Vou fazer isso só quando eu quiser
    END

Exercicio do IF
    FOR  ${COUNT}    IN RANGE    0  11
        IF    ${COUNT}==5
            Log To Console    Estou no número: ${COUNT}
        ELSE IF    ${COUNT}==8
            Log To Console    Estou no número: ${COUNT}
        ELSE
            Log To Console    Eu não sou o número 5 e também não sou o número 8
        END
    END

Criando email
    [Arguments]    ${NOME}    ${SOBRENOME}    ${IDADE}
    ${EMAIL}       Set Variable    ${NOME}_${SOBRENOME}_${IDADE}@robot.com
    Log To Console  ${EMAIL}

    ${EMAIL}       Catenate    SEPARATOR=_   ${NOME}   ${SOBRENOME}   ${IDADE}@robot.com
    Log To Console  ${EMAIL}
    