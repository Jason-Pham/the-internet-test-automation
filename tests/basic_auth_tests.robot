*** Settings ***
Documentation       Basic Auth tests — verifies HTTP Basic Authentication using browser context credentials.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/basic_auth_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Teardown       Close Context

Test Tags           security    basic-auth    smoke


*** Test Cases ***
Successful Login With Valid Credentials
    [Documentation]    Verifies the page is accessible with correct basic auth credentials.
    Open Basic Auth Page With Credentials    admin    admin
    Verify Basic Auth Success

Page Title With Valid Credentials
    [Documentation]    Verifies the page title is correct when authenticated.
    Open Basic Auth Page With Credentials    admin    admin
    Get Title    *=    The Internet
