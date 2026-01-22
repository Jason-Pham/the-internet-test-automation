*** Settings ***
Documentation       Login Tests

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/login_keywords.resource


*** Test Cases ***
Login With Valid Credentials
    [Documentation]    Verifies that a user can log in with valid credentials.
    Open Browser To Login Page
    Submit Credentials    ${USERNAME}    ${PASSWORD}
    Verify Login Success
    Close Browser
