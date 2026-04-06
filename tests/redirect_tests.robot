*** Settings ***
Documentation       Redirect tests — verifies the redirect link navigates to the status codes page.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/redirect_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           navigation    redirect


*** Test Cases ***
Redirect Page Loads
    [Documentation]    Verifies the redirector page loads with the redirect link present.
    [Tags]    smoke
    Open Redirect Page
    Wait For Elements State    ${REDIRECT_BUTTON}    visible

Click Redirect Link Navigates To Status Codes
    [Documentation]    Verifies clicking the redirect link navigates the user to the status codes page.
    [Tags]    smoke
    Open Redirect Page
    Click Redirect Link
    Verify Redirected To Status Codes Page
