*** Settings ***
Documentation               Login screen test suite.

Library                     Collections

Resource                    ../resources/base.resource

Suite Setup                 Setup Environment
Test Setup                  Start session
Test Teardown               Finish session

*** Variables ***

${ENVIRONMENT}              Set Global Variable     ${ENVIRONMENT}
${RECURSO}                  Set Global Variable     &{RECURSO.${ENVIRONMENT}}
${USER}                     bob@example.com
${CORRECT_PASSWORD}         10203040
${INCORRECT_PASSWORD}       40203040

*** Test Cases ***

Valid Login
    [Tags]                  login    CT01-login
    [Documentation]         This test validates a valid login successfully.

    Access hamburger menu
    Wait Until Page Contains            Log In
    Do Login                            ${USER}    ${CORRECT_PASSWORD}
    Validate Home

Validate Wrong Login
    [Tags]                  login    CT02-login
    [Documentation]         This test validates a invalid login

    Access hamburger menu
    Wait Until Page Contains            Log In
    Do Login                            ${USER}    ${INCORRECT_PASSWORD}
    Confirm invalid login