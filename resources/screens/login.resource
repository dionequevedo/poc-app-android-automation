*** Settings ***
Documentation      Login screen elements and actions

Library            AppiumLibrary


*** Keywords ***

Do login

    [Arguments]                     ${LOGIN}            ${PASSWORD}
    ${OP_LOGIN}                     Set Variable        xpath=//*[@text="Log In"]
    ${CHECKPOINT}                   Set Variable        xpath=//*[@content-desc="Login button"]
    ${USER}                         Set Variable        xpath=//*[@content-desc="Username input field"]
    ${PASS}                         Set Variable        xpath=//*[@content-desc="Password input field"]

    Click Element                   ${OP_LOGIN} 
    Wait Until Element Is Visible   ${CHECKPOINT}       1
    Input Text                      ${USER}             ${LOGIN}
    Input Password                  ${PASS}             ${PASSWORD}
    Click Element                   ${CHECKPOINT}

Validate Home
    
    ${CHECKPOINT}                    Set Variable       xpath=//*[@text="Products"]
    Wait Until Element Is Visible    ${CHECKPOINT}      1

Confirm invalid login

    ${ERROR_MESSAGE}                 Set Variable       xpath=//*[@text="Provided credentials do not match any user in this service."]
    
    Wait Until Element Is Visible    ${ERROR_MESSAGE}   1
    