*** Settings ***
Library   Browser
Resource    ../resources/variables/global_variables.robot

*** Test Cases ***
Login With Valid Credentials
    [Documentation]    Verifies that a user can log in with valid credentials.
    Open Browser To Login Page
    Submit Credentials    tomsmith    SuperSecretPassword!
    Verify Login Success

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