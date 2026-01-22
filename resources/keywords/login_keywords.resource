*** Settings ***
Documentation       Login Keywords

Library             Browser
Resource            ../locators/login_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Browser To Login Page
    [Documentation]    Opens the browser and navigates to the login URL.
    Open Browser    ${URL_LOGIN}    chromium    headless=${HEADLESS}
    New Page    ${URL_LOGIN}

Submit Credentials
    [Documentation]    Fills in the login form and clicks submit.
    [Arguments]    ${username}    ${password}

    Fill Text    ${USERNAME_TEXTFIELD}    ${username}
    Fill Text    ${PASSWORD_TEXTFIELD}    ${password}
    Click    ${SUBMIT_BUTTON}

Verify Login Success
    [Documentation]    Checks for the "flash" element that appears after login.
    Get Text    ${VERIFY_LOGIN_SUCCESS_ELEMENT}    *=    You logged into a secure area!
