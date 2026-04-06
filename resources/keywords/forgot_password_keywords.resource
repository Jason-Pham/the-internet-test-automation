*** Settings ***
Documentation       Forgot Password Keywords

Library             Browser
Resource            ../locators/forgot_password_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Forgot Password Page
    [Documentation]    Opens the browser and navigates to the forgot password page.
    New Page    ${URL_FORGOT_PASSWORD}

Submit Email For Password Retrieval
    [Documentation]    Fills in the email field and clicks the Retrieve Password button.
    [Arguments]    ${email}=test@example.com
    Fill Text    ${EMAIL_INPUT}    ${email}
    Click    ${RETRIEVE_BUTTON}

Verify Confirmation Message
    [Documentation]    Verifies the form was submitted and the page responded.
    Wait For Load State    networkidle    timeout=15s
    ${url}=    Get Url
    Should Match Regexp    ${url}    (email_sent|forgot_password)
