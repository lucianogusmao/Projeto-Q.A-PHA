*** Settings ***
Documentation    aqui estarão presentes todas a configurações de Setup e Teardown
...              Essas configurações, podem ser utilizados tanto para Suites Setup/Teardown
...              quanto para test setup/teardown.   

Resource        package.robot

*** Keywords ***

Abrir navegador
    Open Browser        about:blank        chrome
    Go To                http://automationpractice.com/index.php
    Maximize Browser Window

Fechar navegador    
    Capture Page Screenshot
    Close Browser