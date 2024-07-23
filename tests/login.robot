*** Settings ***
Documentation       Login screen test suite.

Resource                    ../resources/base.resource

Test Setup                  Start session
Test Teardown               Finish session

*** Variables ***

${USER}                     bob@example.com
${CORRECT_PASSWORD}         10203040
${INCORRECT_PASSWORD}       40203040

*** Test Cases ***

Valid Login
    [Documentation]        This test validates a valid login successfully.

    Access hamburger menu
    Wait Until Page Contains            Log In
    Do Login                            ${USER}    ${CORRECT_PASSWORD}
    Validate Home

Validate Wrong Login
    [Documentation]        This test validates a invalid login

    Access hamburger menu
    Wait Until Page Contains            Log In
    Do Login                            ${USER}    ${INCORRECT_PASSWORD}
    Confirm invalid login