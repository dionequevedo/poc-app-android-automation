*** Settings ***
Documentation       Cart test suite.

Resource                    ../resources/base-local.resource

Test Setup                  Start session
Test Teardown               Finish session

*** Test Cases ***

Being able to access the empty cart
    [Documentation]    This test validates access to the empty cart

    Click on cart
    Validate empty cart
    Sleep                    1
    Return to shopping