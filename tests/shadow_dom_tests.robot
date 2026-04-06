*** Settings ***
Documentation       Shadow DOM tests — verifies text content inside Web Component shadow DOM elements.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/shadow_dom_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           javascript    shadow-dom    smoke


*** Test Cases ***
Shadow DOM Page Loads
    [Documentation]    Verifies the shadow DOM page loads with custom element hosts.
    Open Shadow DOM Page
    ${count}=    Get Element Count    my-paragraph
    Should Be True    ${count} > 0

First Shadow Host Contains Expected Text
    [Documentation]    Verifies the first shadow DOM element contains the expected paragraph text.
    Open Shadow DOM Page
    Verify Shadow DOM Contains Text    ${SHADOW_HOST_1}    Let's have

Second Shadow Host Contains Expected Text
    [Documentation]    Verifies the second shadow DOM element contains expected paragraph text.
    Open Shadow DOM Page
    Verify Shadow DOM Contains Text    ${SHADOW_HOST_2}    Inside a div
