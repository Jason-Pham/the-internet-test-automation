*** Settings ***
Documentation       Status Codes tests — verifies each HTTP status code page loads and displays the correct code.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/status_codes_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           navigation    status-codes


*** Test Cases ***
Status Codes Page Loads
    [Documentation]    Verifies the status codes landing page shows links for all four codes.
    [Tags]    smoke
    Open Status Codes Page
    Wait For Elements State    ${LINK_200}    visible
    Wait For Elements State    ${LINK_301}    visible
    Wait For Elements State    ${LINK_404}    visible
    Wait For Elements State    ${LINK_500}    visible

Status Code 200 Page Shows Correct Code
    [Documentation]    Verifies the 200 status code page displays the code in its body text.
    [Tags]    smoke
    Open Status Codes Page
    Click Status Code Link    ${LINK_200}
    Verify Status Code Page Text    200

Status Code 301 Page Shows Correct Code
    [Documentation]    Verifies the 301 status code page displays the code in its body text.
    [Tags]    smoke
    Open Status Codes Page
    Click Status Code Link    ${LINK_301}
    Verify Status Code Page Text    301

Status Code 404 Page Shows Correct Code
    [Documentation]    Verifies the 404 status code page displays the code in its body text.
    [Tags]    smoke
    Open Status Codes Page
    Click Status Code Link    ${LINK_404}
    Verify Status Code Page Text    404

Status Code 500 Page Shows Correct Code
    [Documentation]    Verifies the 500 status code page displays the code in its body text.
    [Tags]    smoke
    Open Status Codes Page
    Click Status Code Link    ${LINK_500}
    Verify Status Code Page Text    500

Back Link Returns To Status Codes Page
    [Documentation]    Verifies the back link on a status code detail page returns to the main status codes page.
    [Tags]    regression
    Open Status Codes Page
    Click Status Code Link    ${LINK_200}
    Go Back To Status Codes Page
    ${url}=    Get Url
    Should Contain    ${url}    status_codes
