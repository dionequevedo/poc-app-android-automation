*** Settings ***
Documentation       Product screen test suite.

Library                     Collections

Resource                    ../resources/base.resource

Suite Setup                 Setup Environment
Test Setup                  Start session
Test Teardown               Finish session

*** Test Cases ***
Sort by asc price
    [Tags]                 products    CT01-products
    [Documentation]        This test validates the ordering of products by increasing price

    Select sort button
    Validate selection screen
    Select order by ascending price
    Validate first item    $7.99

Sort by asc name
    [Tags]                 products    CT02-products
    [Documentation]        This test validates ordering products in ascending order by name

    Select sort button
    Validate selection screen
    Select order by ascending name
    Validate first item    Sauce Labs Backpack

Sort by desc price
    [Tags]                 products    CT03-products
    [Documentation]        This test validates the ordering of products by decreasing price

    Select sort button
    Validate selection screen
    Select order by descending price
    Validate first item    $49.99

Sort by desc name
    [Tags]                 products    CT04-products
    [Documentation]        This test validates ordering products in descending order by name

    Select sort button
    Validate selection screen
    Select order by descending name
    Validate first item    Test.allTheThings() T-Shirt

Add two red backpacks to cart without logging in
    [Tags]                 products    CT05-products
    [Documentation]        This test should validate the addition of two red backpacks to the cart

    Validate product screen
    Select item            Sauce Labs Backpack
    Select color           red
    Add one more item
    Add to cart
    Check quantity of items in cart
    ...                    2
    Click on cart
    Checkpoint my cart
    Validate color quantity and total
    ...                    red    2    29.99
    Proceed to checkout
