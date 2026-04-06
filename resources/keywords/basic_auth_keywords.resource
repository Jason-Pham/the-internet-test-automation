*** Settings ***
Documentation       Basic Auth Keywords

Library             Browser
Resource            ../locators/basic_auth_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Basic Auth Page With Credentials
    [Documentation]    Opens the basic auth page supplying HTTP credentials via browser context.
    [Arguments]    ${username}=admin    ${password}=admin
    New Context    httpCredentials={"username": "${username}", "password": "${password}"}
    New Page    ${URL_BASIC_AUTH}

Verify Basic Auth Success
    [Documentation]    Verifies the authenticated page shows the success message.
    Get Text    ${BASIC_AUTH_SUCCESS}    *=    Congratulations! You must have the proper credentials.
