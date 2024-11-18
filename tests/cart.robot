*** Settings ***
Documentation       Cart test suite.

Library                     YAMLLibrary

Suite Setup                 Setup Environment
Test Setup                  Start session
Test Teardown               Finish session

Variables

${CONFIG}                   Load YAML               ../config.yaml
${ENVIRONMENT}              Set Global Variable     ${ENVIRONMENT}

*** Keywords ***
Setup Environment 
    ${RESOURCE}             Get From Dictionary 
    ...                     ${CONFIG}       ${ENVIRONMENT}  resource 

Log                         Using resource: ${RESOURCE}

*** Test Cases ***

Being able to access the empty cart
    [Documentation]    This test validates access to the empty cart

    Click on cart
    Validate empty cart
    Sleep                    1
    Return to shopping