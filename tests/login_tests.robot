*** Settings ***
Library   Browser
Resource    ../resources/variables/global_variables.robot
Resource    ../resources/keywords/login_keywords.robot

*** Test Cases ***
Login With Valid Credentials
    [Documentation]    Verifies that a user can log in with valid credentials.
    Open Browser To Login Page
    Submit Credentials    tomsmith    SuperSecretPassword!
    Verify Login Success
    Close Browser
    