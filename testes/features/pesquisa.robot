*** Settings ***

Documentation        Aqui neste arquivo estarão presentes todos os testes
...                  Web automatizados com suas Keywords.

Resource         ../../src/config/package.robot

Test Setup         Abrir navegador   
Test Teardown      Fechar navegador


*** Test Cases ***

Caso de Teste 01: Pesquisar produto existente
    [Tags]        PESQUISA
    Acessar a página home do site Automation Practice
    Digitar o nome do produto "Blouse" no campo de pesquisa
    Clicar no botão pesquisar
    Conferir se o produto Blouse foi listado no site




