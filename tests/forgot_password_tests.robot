*** Settings ***
Documentation       Forgot Password tests — verifies the forgot password form accepts an email and redirects.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/forgot_password_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           forms    forgot-password


*** Test Cases ***
Forgot Password Page Loads
    [Documentation]    Verifies the forgot password page renders the email input and submit button.
    [Tags]    smoke
    Open Forgot Password Page
    Wait For Elements State    ${EMAIL_INPUT}      visible
    Wait For Elements State    ${RETRIEVE_BUTTON}  visible

Submit Valid Email Address
    [Documentation]    Verifies submitting a valid email redirects to the email sent confirmation.
    [Tags]    smoke
    Open Forgot Password Page
    Submit Email For Password Retrieval    test@example.com
    Verify Confirmation Message

Submit Another Valid Email
    [Documentation]    Verifies the form works with a different email address.
    [Tags]    regression
    Open Forgot Password Page
    Submit Email For Password Retrieval    user@test.org
    Verify Confirmation Message
