*** Settings ***
Documentation       Dynamic Loading tests — verifies waiting for elements that are hidden or rendered asynchronously.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/dynamic_loading_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           dynamic    dynamic-loading    smoke


*** Test Cases ***
Example 1 Start Button Is Visible
    [Documentation]    Verifies the Start button is present on dynamic loading example 1.
    Open Dynamic Loading Page    ${URL_DYNAMIC_LOADING_1}
    Wait For Elements State    ${START_BUTTON}    visible

Example 1 Shows Hello World After Loading
    [Documentation]    Verifies clicking Start reveals the hidden "Hello World!" text (example 1).
    Open Dynamic Loading Page    ${URL_DYNAMIC_LOADING_1}
    Start Loading
    Wait For Loading To Complete
    Verify Finish Text    Hello World!

Example 2 Start Button Is Visible
    [Documentation]    Verifies the Start button is present on dynamic loading example 2.
    Open Dynamic Loading Page    ${URL_DYNAMIC_LOADING_2}
    Wait For Elements State    ${START_BUTTON}    visible

Example 2 Renders Element After Loading
    [Documentation]    Verifies clicking Start renders the "Hello World!" element (example 2).
    Open Dynamic Loading Page    ${URL_DYNAMIC_LOADING_2}
    Start Loading
    Wait For Loading To Complete
    Verify Finish Text    Hello World!
