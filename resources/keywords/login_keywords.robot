*** Settings ***
Library      Browser
Resource    ../locators/login_locators.robot
Resource    ../variables/global_variables.robot

*** Keywords ***
Open Browser To Login Page
    [Documentation]    Opens the browser and navigates to the login URL.
    Open Browser    ${URL}    chromium    headless=True
    New Page       ${URL}

Submit Credentials
    [Arguments]    ${username}    ${password}
    [Documentation]    Fills in the login form and clicks submit.

    Fill Text    ${username_textfield}    ${username}
    Fill Text    ${password_textfield}    ${password}
    Click    ${submit_button}

Verify Login Success
    [Documentation]    Checks for the "flash" element that appears after login.
    Get Text    ${verify_login_success_element}    *=    You logged into a secure area!