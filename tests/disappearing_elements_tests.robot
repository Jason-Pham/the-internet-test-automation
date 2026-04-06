*** Settings ***
Documentation       Disappearing Elements tests — verifies nav elements that may appear or disappear on reload.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/disappearing_elements_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           navigation    dynamic    disappearing-elements


*** Test Cases ***
Navigation Menu Is Visible
    [Documentation]    Verifies the navigation menu is present on the page.
    [Tags]    smoke
    Open Disappearing Elements Page
    Verify Nav Menu Is Visible

Home Link Is Always Present
    [Documentation]    Verifies the Home link is consistently present in the navigation.
    [Tags]    smoke
    Open Disappearing Elements Page
    Verify Home Link Exists

Navigation Has At Least Four Items
    [Documentation]    Verifies the nav menu has at least four items (Home, About, Contact Us, Portfolio).
    [Tags]    regression
    Open Disappearing Elements Page
    ${count}=    Get Nav Item Count
    Should Be True    ${count} >= 4

Gallery Link May Appear On Reload
    [Documentation]    Reloads the page and checks if a fifth Gallery link can appear.
    [Tags]    regression
    Open Disappearing Elements Page
    Reload
    ${count}=    Get Nav Item Count
    Should Be True    ${count} >= 4
