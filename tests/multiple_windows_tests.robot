*** Settings ***
Documentation       Multiple Windows tests — verifies opening and switching to a new browser window/tab.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/multiple_windows_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           navigation    multiple-windows


*** Test Cases ***
New Window Link Is Present
    [Documentation]    Verifies the "Click Here" link to open a new window is visible.
    [Tags]    smoke
    Open Multiple Windows Page
    Wait For Elements State    ${NEW_WINDOW_LINK}    visible

Click Opens New Window With Heading
    [Documentation]    Verifies clicking the link opens a new window that contains the "New Window" heading.
    [Tags]    smoke
    Open Multiple Windows Page
    Click New Window Link And Switch
    Verify New Window Heading    New Window
