*** Settings ***
Documentation       Redirect Keywords

Library             Browser
Resource            ../locators/redirect_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Redirect Page
    [Documentation]    Opens the browser and navigates to the redirect page.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${URL_REDIRECT}

Click Redirect Link
    [Documentation]    Clicks the redirect anchor link.
    Click    ${REDIRECT_BUTTON}

Verify Redirected To Status Codes Page
    [Documentation]    Verifies the current URL is the status codes page after redirect.
    ${url}=    Get Url
    Should Contain    ${url}    status_codes
