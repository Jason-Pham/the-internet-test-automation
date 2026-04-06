*** Settings ***
Documentation       Context Menu tests — verifies right-click context menu triggers a JavaScript alert.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/context_menu_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           javascript    context-menu


*** Test Cases ***
Right Click Hotspot Triggers Alert
    [Documentation]    Verifies right-clicking the hotspot fires a JS alert which can be accepted.
    [Tags]    smoke
    Open Context Menu Page
    Right-Click Hotspot And Handle Alert

Hotspot Is Visible On Page
    [Documentation]    Verifies the right-click hotspot element is present on the page.
    [Tags]    smoke
    Open Context Menu Page
    Wait For Elements State    ${CONTEXT_MENU_HOTSPOT}    visible
