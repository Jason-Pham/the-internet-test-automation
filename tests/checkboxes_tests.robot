*** Settings ***
Documentation       Checkboxes tests — verifies checking and unchecking checkbox inputs.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/checkboxes_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           forms    checkboxes


*** Test Cases ***
Checkbox 1 Is Initially Unchecked
    [Documentation]    Verifies the first checkbox is unchecked by default.
    [Tags]    smoke
    Open Checkboxes Page
    Verify Checkbox State    ${CHECKBOX_1}    ${False}

Checkbox 2 Is Initially Checked
    [Documentation]    Verifies the second checkbox is checked by default.
    [Tags]    smoke
    Open Checkboxes Page
    Verify Checkbox State    ${CHECKBOX_2}    ${True}

Check Checkbox 1
    [Documentation]    Verifies checkbox 1 can be checked.
    [Tags]    smoke
    Open Checkboxes Page
    Check Checkbox    ${CHECKBOX_1}
    Verify Checkbox State    ${CHECKBOX_1}    ${True}

Uncheck Checkbox 2
    [Documentation]    Verifies checkbox 2 can be unchecked.
    [Tags]    smoke
    Open Checkboxes Page
    Uncheck Checkbox    ${CHECKBOX_2}
    Verify Checkbox State    ${CHECKBOX_2}    ${False}

Toggle Both Checkboxes
    [Documentation]    Verifies both checkboxes can be toggled to opposite states.
    [Tags]    regression
    Open Checkboxes Page
    Check Checkbox    ${CHECKBOX_1}
    Uncheck Checkbox    ${CHECKBOX_2}
    Verify Checkbox State    ${CHECKBOX_1}    ${True}
    Verify Checkbox State    ${CHECKBOX_2}    ${False}
