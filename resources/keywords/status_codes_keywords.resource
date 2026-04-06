*** Settings ***
Documentation       Status Codes Keywords

Library             Browser
Resource            ../locators/status_codes_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Status Codes Page
    [Documentation]    Opens the browser and navigates to the status codes page.
    New Page    ${URL_STATUS_CODES}

Click Status Code Link
    [Documentation]    Clicks the link for a given HTTP status code.
    [Arguments]    ${link_locator}
    Click    ${link_locator}

Verify Status Code Page Text
    [Documentation]    Verifies the status code page shows the expected code in the body text.
    [Arguments]    ${expected_code}
    Get Text    ${PAGE_TEXT}    *=    ${expected_code}

Go Back To Status Codes Page
    [Documentation]    Clicks the back link to return to the status codes main page.
    Click    ${BACK_LINK}
