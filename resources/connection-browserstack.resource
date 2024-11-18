*** Settings ***


*** Variables ***

${username}                     dionequevedo_5HJ2iT
${accesskey}                    zksUnXCjVuf2rQpEqAwQ
${REMOTE_URL}                   https://${username}:${accesskey}@hub-cloud.browserstack.com/wd/hub
${DEVICE_NAME}                  Google Pixel 3
${PLATFORM_NAME}                android
${PLATFORM_VERSION}             9.0
${AUTOMATION_NAME}              UIAutomator2
${APP}                          bs://683f98a1523a6e2db48b07736f38105a746ce588
${ANDROID_NEW_COMMAND_TIMEOUT}  3600

*** Keywords ***

Start session
    [Tags]      SessionStart

    ${options}    Create Dictionary
    ...         projectName=First Robot Local project
    ...         buildName=browserstack-build-1
    ...         sessionName=BStack local_test
    ...         local=true

	Open Application    
    ...         ${REMOTE_URL}    
    ...         platformName=${PLATFORM_NAME}    
    ...         platformVersion=${PLATFORM_VERSION}    
    ...         deviceName=${DEVICE_NAME}   
    ...         autoGrantPermissions=true
    ...         app=${APP}
    ...         bstack:options=${options}

