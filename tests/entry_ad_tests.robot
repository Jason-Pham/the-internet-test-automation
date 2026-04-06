*** Settings ***
Documentation       Entry Ad tests — verifies the modal dialog that appears on page load can be closed.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/entry_ad_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           javascript    entry-ad


*** Test Cases ***
Modal Appears On Page Load
    [Documentation]    Verifies the entry ad modal is visible when the page loads.
    [Tags]    smoke
    Open Entry Ad Page
    Verify Modal Is Visible

Modal Can Be Closed
    [Documentation]    Verifies the modal can be dismissed by clicking the close link.
    [Tags]    smoke
    Open Entry Ad Page
    Verify Modal Is Visible
    Close Modal
    Verify Modal Is Closed

Modal Title Contains Expected Text
    [Documentation]    Verifies the modal heading text matches the expected copy.
    [Tags]    regression
    Open Entry Ad Page
    Verify Modal Is Visible
    Get Text    ${MODAL_TITLE}    *=    THIS IS A MODAL WINDOW
