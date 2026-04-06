*** Settings ***
Documentation       Dynamic Controls tests — verifies enabling/disabling inputs and showing/hiding checkboxes.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/dynamic_controls_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           dynamic    forms    dynamic-controls


*** Test Cases ***
Checkbox Is Visible By Default
    [Documentation]    Verifies the checkbox is visible when the page first loads.
    [Tags]    smoke
    Open Dynamic Controls Page
    Wait For Elements State    ${CHECKBOX}    visible

Remove Checkbox Via Toggle Button
    [Documentation]    Verifies clicking Remove hides the checkbox and shows a confirmation message.
    [Tags]    smoke
    Open Dynamic Controls Page
    Toggle Checkbox And Wait
    Verify Message Text    ${CHECKBOX_MESSAGE}    It's gone!

Input Is Disabled By Default
    [Documentation]    Verifies the text input is disabled when the page first loads.
    [Tags]    smoke
    Open Dynamic Controls Page
    Verify Input Is Disabled

Enable Input Via Toggle Button
    [Documentation]    Verifies clicking Enable makes the text input editable.
    [Tags]    smoke
    Open Dynamic Controls Page
    Toggle Input And Wait
    Verify Input Is Enabled
    Verify Message Text    ${INPUT_MESSAGE}    It's enabled!

Disable Input After Enabling
    [Documentation]    Verifies the input can be enabled and then disabled again.
    [Tags]    regression
    Open Dynamic Controls Page
    Toggle Input And Wait
    Verify Input Is Enabled
    Toggle Input And Wait
    Verify Input Is Disabled
    Verify Message Text    ${INPUT_MESSAGE}    It's disabled!
