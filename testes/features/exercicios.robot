*** Settings ***
Documentation  Aqui estarão presentes todos exercicios da aula de automação.
...            Então não se sinta perdido aqui a gente descreve o que ta fazendo.
Library    String

*** Variables ***
&{Pessoa}    nome=Luciano
...          sobrenome=Gusmão
...          idade=45
...          endereco=Mario numeoro 186 Mauá-SP
...          carro=Fiat Ideia  
...          datanascimento=22/08/1994

@{FRUTAS}        
...                banana
...                morango    
...                abacaxi
...                melancia
...                manga

*** Keywords ***
Somar dois numeros
    [Arguments]    ${NUM_A}    ${NUM_B}
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    #[Return]    ${SOMA}
    Log To Console         ${SOMA}

#EMBUTIDO NA KEYWORDS
Somar os numeros "${NUM_A}" e "${NUM_B}"
    ${SOMA}    Evaluate    ${NUM_A}+${NUM_B}
    Log To Console         ${SOMA}


Multiplicar os numeros "${NUM_A}" e "${NUM_B}" 
        ${RESULTADO}     Evaluate    ${NUM_A}+${NUM_B}
        [Return]                     ${RESULTADO}
        Log To Console               ${RESULTADO}

Novo email
    [Arguments]        ${NAME}    ${LAST_NAME}    ${AGE}
    Log To Console     \n${NAME}_${LAST_NAME}_${AGE}@robot.com

    ${EMAIL}        Convert To String    item"${NAME}_${LAST_NAME}_${AGE}@robot.com"
    Log To Console    message    ${EMAIL} 

    ${CONCATENAR}    Catenate    separator    ${NAME}    ${LAST_NAME}    ${AGE}@robot.com
    Log To Console    ${CONCATENAR}

    #FOR

Contar de 0 a 9
    FOR    ${counter}    IN RANGE  0    9
        Log To Console    ${counter}
    END    

Imprimir Lista de FRUTAS
    @{FRUTAS}     Create List    Banana    Goiaba    Pera    Abacaxi    Acelora
    FOR    ${fruta}    IN    @{FRUTAS}
        Log To Console       ${fruta}        
    END   

Imprimindo em qual numero estou
    FOR    ${counter}    IN RANGE  0    11
        Log To Console   Estou no número: ${counter}
    END  


Imprimindo Profecia
    @{PAISES}     Create List    Holanda    USA    Japão    Dubai    Grécia
    FOR    ${pais}    IN    @{PAISES}
        Log To Console    Eu profetizo que irei para: ${pais}        
    END  


Listar números 5 ou 8
    FOR    ${NUMERO}    IN RANGE  0      11
       IF    ${NUMERO}==5
             Log To Console    Eu estou no número:${NUMERO}
           
       ELSE IF     ${NUMERO}==8
             Log To Console    Estou no número:${NUMERO}
           
       END 
    END

*** Test Cases ***
Cenario: Listar números 5 e 8
    [Tags]    Listar
    Listar números 5 ou 8

Cenario: Profetizando
    [Tags]    PROFECIA
    Imprimindo Profecia

Cenario: imprimindo de 0 a 10
    [Tags]        ESTOU
    Imprimindo em qual numero estou

Cenario: Validar contagem 0 a 9
    [Tags]    Contador
    Contar de 0 a 9 

Cenario: Validar criacao de email
    [Tags]       EMAIL
    Novo email       Luciano    Gusmao    45

Cenario: validar soma dois numeros
    [Tags]    SOMA
    #Somar dois numeros    546    789
    ${RESULTADO}    Somar dois numeros    546    789
    Log To Console    ${RESULTADO}                      

Cenario: Somar numeros com argumento embutido
    [Tags]            EMBUTIDO
    Somar os numeros "951" e "951"

Imprimindo o console com os dados da Pessoa
    Log To Console    \n${Pessoa.nome}
    Log To Console    ${Pessoa.sobrenome}
    Log To Console    ${Pessoa.idade}
    Log To Console    ${Pessoa.endereco}
    Log To Console    ${Pessoa.carro}
    Log To Console    ${Pessoa.datanascimento}

Cenario: Validar impressão da lista
    [Tags]        LISTA        
    Log To Console        \n${FRUTAS[0]}
    Log To Console        ${FRUTAS[1]}
    Log To Console        ${FRUTAS[2]}
    Log To Console        ${FRUTAS[3]}
    Log To Console        ${FRUTAS[4]}