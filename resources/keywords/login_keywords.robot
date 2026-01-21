*** Settings ***
Library      Browser
Resource    ../locators/login_locators.robot
Resource    ../variables/global_variables.robot

*** Keywords ***
Open Browser To Login Page
    [Documentation]    Opens the browser and navigates to the login URL.
    Open Browser    ${URL}    chromium    headless=False
    New Page       ${URL}

Submit Credentials
    [Arguments]    ${username}    ${password}
    [Documentation]    Fills in the login form and clicks submit.

    Fill Text    id=username    ${username}
    Fill Text    id=password    ${password}
    Click    button[type='submit']

Verify Login Success
    [Documentation]    Checks for the "flash" element that appears after login.
    Get Text    id=flash    *=    You logged into a secure area!