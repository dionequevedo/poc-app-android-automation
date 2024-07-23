*** Settings ***
Documentation      Cart screen elements and actions

Library            AppiumLibrary


*** Keywords ***

Click on cart
    
    ${CART}                 Set Variable    //*[@content-desc="cart badge"]

    Click Element           ${CART}

Validate empty cart
    
    ${NO_ITEMS}             Set Variable    xpath=//*[@text="No Items"]

    Wait Until Element Is Visible    
    ...                     ${NO_ITEMS}    1

Return to shopping

    ${GO_SHOPPING}          Set Variable    //*[@text="Go Shopping"]

    Click Element           ${GO_SHOPPING}
    Wait Until Page Does Not Contain Element    
    ...                     ${GO_SHOPPING}    1
