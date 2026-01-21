*** Settings ***
Library      SeleniumLibrary
Resource    ../locators/login_locators.robot
Resource    ../variables/global_variables.robot

*** Keywords ***
Login To Application
    [Documentation]    Logs in to the application using the provided username and password.
    Input Text    ${username_field}    ${USERNAME}
    Input Text    ${password_field}    ${PASSWORD}
    Click Button  ${login_button}
    Wait Until Page Contains Element    ${dashboard_element}    timeout=10s

Verify Login Success
    [Documentation]    Verifies that the user is successfully logged in.
    Page Should Contain Element    ${dashboard_element}

Verify Login Failure
    [Documentation]    Verifies that the login attempt failed.
    Page Should Contain Element    ${error_message_element}