*** Settings ***
Documentation       Floating Menu tests — verifies the navigation menu remains fixed during page scroll.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/floating_menu_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           navigation    floating-menu


*** Test Cases ***
Floating Menu Is Visible On Page Load
    [Documentation]    Verifies the floating menu is visible when the page initially loads.
    [Tags]    smoke
    Open Floating Menu Page
    Verify Floating Menu Is Visible

Menu Links Are All Visible On Load
    [Documentation]    Verifies all four navigation links are visible on page load.
    [Tags]    smoke
    Open Floating Menu Page
    Verify Menu Links Are Visible

Floating Menu Remains Visible After Scroll
    [Documentation]    Verifies the floating menu stays visible after scrolling to the bottom of the page.
    [Tags]    smoke
    Open Floating Menu Page
    Scroll To Bottom Of Page
    Verify Floating Menu Is Visible

Menu Links Remain Visible After Scroll
    [Documentation]    Verifies all four menu links remain visible after scrolling down.
    [Tags]    regression
    Open Floating Menu Page
    Scroll To Bottom Of Page
    Verify Menu Links Are Visible
