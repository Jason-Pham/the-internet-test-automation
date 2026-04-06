*** Settings ***
Documentation       Dropdown tests — verifies selecting options from a standard HTML dropdown.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/dropdown_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           forms    dropdown


*** Test Cases ***
Dropdown Is Present On Page
    [Documentation]    Verifies the dropdown element is visible on the page.
    [Tags]    smoke
    Open Dropdown Page
    Wait For Elements State    ${DROPDOWN}    visible

Select Option 1
    [Documentation]    Verifies Option 1 can be selected from the dropdown.
    [Tags]    smoke
    Open Dropdown Page
    Select Dropdown Option    1
    Verify Selected Option    Option 1

Select Option 2
    [Documentation]    Verifies Option 2 can be selected from the dropdown.
    [Tags]    smoke
    Open Dropdown Page
    Select Dropdown Option    2
    Verify Selected Option    Option 2

Switch Between Options
    [Documentation]    Verifies selecting one option then another updates the dropdown correctly.
    [Tags]    regression
    Open Dropdown Page
    Select Dropdown Option    1
    Verify Selected Option    Option 1
    Select Dropdown Option    2
    Verify Selected Option    Option 2
