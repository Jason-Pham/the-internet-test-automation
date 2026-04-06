*** Settings ***
Documentation       Exit Intent tests — verifies the modal that appears when the user moves to leave the page.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/exit_intent_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           javascript    exit-intent


*** Test Cases ***
Exit Intent Modal Triggered By Mouse Leave
    [Documentation]    Verifies the exit intent modal appears after a mouseout event on the document.
    [Tags]    smoke
    Open Exit Intent Page
    Trigger Exit Intent Via JavaScript
    Verify Exit Intent Modal Is Visible

Exit Intent Modal Can Be Closed
    [Documentation]    Verifies the exit intent modal can be dismissed after it appears.
    [Tags]    smoke
    Open Exit Intent Page
    Trigger Exit Intent Via JavaScript
    Verify Exit Intent Modal Is Visible
    Close Exit Intent Modal
    Verify Exit Intent Modal Is Closed
