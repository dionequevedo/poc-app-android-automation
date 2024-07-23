*** Settings ***

Library             AppiumLibrary

Resource            screens/login.resource
Resource            screens/cart.resource
Resource            screens/products.resource

*** Variables ***

${REMOTE_URL}                   http://localhost:4723
${DEVICE_NAME}                  qazando30
${PLATFORM_NAME}                android
${PLATFORM_VERSION}             11.0
${AUTOMATION_NAME}              UIAutomator2
${APP}                          ${CURDIR}/../apps/Android-MyDemoAppRN.1.3.0.build-244.apk
${REMOTE_URL}                   http://localhost:4723
${ANDROID_NEW_COMMAND_TIMEOUT}  3600

*** Keywords ***

Start session
    [Tags]      SessionStart

	Open Application    
    ...         ${REMOTE_URL}    
    ...         platformName=${PLATFORM_NAME}    
    ...         platformVersion=${PLATFORM_VERSION}    
    ...         deviceName=${DEVICE_NAME}   
    ...         autoGrantPermissions=true
    ...         newCommandTimeout=${ANDROID_NEW_COMMAND_TIMEOUT}
    ...         app=${APP}
    ...         automationName=${AUTOMATION_NAME}

Finish session
    [Tags]      SessionClose

    Capture Page Screenshot
	Close Application

Access hamburger menu
    
    ${HAMBURGER_MENU}    Set Variable    //*[@content-desc="open menu"]

    Click Element        ${HAMBURGER_MENU}
