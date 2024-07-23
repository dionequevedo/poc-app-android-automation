*** Settings ***
Documentation           Login screen elements and actions

Library                 AppiumLibrary

*** Variables ***

${SORT_BUTTON}                          xpath=//*[@content-desc="sort button"]
${CHECKPOINT_SELECION_SCREEN}           xpath=//*[@text="Sort by:"]
${CHECKPOINT_PRODUCT_SCREEN}            xpath=//*[@content-desc="container header"]//*[@text="Products"]
${CHECKPOINT_SCREEN_BUY}                xpath=//*[@text="Product Highlights"]
${SELECTION_ORDER_BY_NAME_ASC}          xpath=//*[@content-desc="nameAsc"]
${SELECTION_ORDER_BY_NAME_DESC}         xpath=//*[@content-desc="nameDesc"]
${SELECTION_ORDER_BY_PRICE_ASC}         xpath=//*[@content-desc="priceAsc"]
${SELECTION_ORDER_BY_PRICE_DESC}        xpath=//*[@content-desc="priceDesc"]
${PLUS_BUTTON}                          xpath=//*[@content-desc="counter plus button"]
${MINUS_BUTTON}                         xpath=//*[@content-desc="counter minus button"]
${ADD_TO_CART_BUTTON}                   xpath=//*[@content-desc="Add To Cart button"]//*[@text="Add To Cart"]
${CART_BUTTON}                          xpath=//*[@content-desc="cart badge"]
${CHECKPOINT_MY_CART}                   xpath=//*[@text="My Cart"]
${PROCEED_TO_CHECKOUT}                  xpath=//*[@text="Proceed To Checkout"]
${CHECKPOINT_LOGIN_SCREEN}              xpath=//*[@content-desc="Login button"]


*** Keywords ***
Select sort button
    Wait Until Page Contains Element     ${SORT_BUTTON}    1
    Click Element                        ${SORT_BUTTON}

Validate selection screen
    Wait Until Page Contains Element     ${CHECKPOINT_SELECION_SCREEN}    1

Validate product screen
    Wait Until Page Contains Element     ${CHECKPOINT_PRODUCT_SCREEN}    1

Select order by ascending name
    Click Element                        ${SELECTION_ORDER_BY_NAME_ASC}

Select order by descending name
    Click Element                        ${SELECTION_ORDER_BY_NAME_DESC}

Select order by ascending price
    Click Element                        ${SELECTION_ORDER_BY_PRICE_ASC}

Select order by descending price
    Click Element                        ${SELECTION_ORDER_BY_PRICE_DESC}

Validate first item
    [Arguments]                          ${SELECTION}
    Wait Until Page Contains Element     xpath=(//*[@content-desc="store item"])[1]//*[@text="${SELECTION}"]    1

Select item
    [Arguments]                          ${ITEM}
    Click Element                        xpath=//*[@text="${ITEM}" and @content-desc="store item text"]

Select color
    [Arguments]                          ${COLOR}
    ${SELECTED_COLOR}                    Set Variable    xpath=//*[@content-desc="${COLOR} circle"]
    Wait Until Page Contains Element     ${CHECKPOINT_SCREEN_BUY}    1
    Click Element                        ${SELECTED_COLOR}

Add one more item
    Click Element                        ${PLUS_BUTTON}

Add to cart
    Click Element                        ${ADD_TO_CART_BUTTON}

Check quantity of items in cart
    [Arguments]                          ${QUANTITY}
    Wait Until Element Is Visible        ${CART_BUTTON}//*[@text="${QUANTITY}"]    1

Checkpoint my cart
    Wait Until Element Is Visible        ${CHECKPOINT_MY_CART}        1

Validate color quantity and total
    [Arguments]                          ${COLOR}    ${QUANTITY}    ${ITEM_VALUE}
    ${CHECK_ITEM_QNT}                    Set Variable    xpath=//*[@content-desc="counter amount"]//*[@text="${QUANTITY}"]
    ${CHECK_ITEM_VALUE}                  Set Variable    xpath=//*[@content-desc="product price" and @text="$${ITEM_VALUE}"]
    ${TOTAL}                             Set Variable    ${${QUANTITY} * ${ITEM_VALUE}}
    ${CHECK_TTL_ITEMS_VALUE}             Set Variable    xpath=//*[@content-desc="total price" and @text="$${TOTAL}"]
    ${SELECTED_COLOR}                    Set Variable    xpath=//*[@content-desc="${COLOR} circle"]
    Wait Until Element Is Visible        ${SELECTED_COLOR}            1
    Wait Until Element Is Visible        ${CHECK_ITEM_QNT}            1
    Wait Until Element Is Visible        ${CHECK_ITEM_VALUE}          1
    Wait Until Element Is Visible        ${CHECK_TTL_ITEMS_VALUE}     1

Proceed to checkout
    Click Element                        ${PROCEED_TO_CHECKOUT}
    Wait Until Element Is Visible        ${CHECKPOINT_LOGIN_SCREEN}   1