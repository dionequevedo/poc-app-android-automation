*** Settings ***

Library                     Collections
Library                     AppiumLibrary

Resource                    screens/login.resource
Resource                    screens/cart.resource
Resource                    screens/products.resource

Resource                    ${TARGET}

*** Variables ***

${ENVIRONMENT}              Set Global Variable     ${ENVIRONMENT}
${TARGET}                   ${RECURSO.${ENVIRONMENT}}

*** Keywords ***


Finish session
    [Tags]      SessionClose

    Capture Page Screenshot
	Close Application

Access hamburger menu
    
    ${HAMBURGER_MENU}    Set Variable    //*[@content-desc="open menu"]

    Click Element        ${HAMBURGER_MENU}