*** Settings ***
Documentation       Cart test suite.

Library                     Collections

Resource                    ../resources/base.resource

Suite Setup                 Setup Environment
Test Setup                  Start session
Test Teardown               Finish session

*** Variables ***

${ENVIRONMENT}              Set Global Variable     ${ENVIRONMENT}

*** Test Cases ***

Being able to access the empty cart
    [Tags]                 cart    CT01-cart
    [Documentation]    This test validates access to the empty cart

    Click on cart
    Validate empty cart
    Sleep                    1
    Return to shopping