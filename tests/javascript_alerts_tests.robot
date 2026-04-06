*** Settings ***
Documentation       JavaScript Alerts tests — verifies JS alert, confirm, and prompt dialogs can be handled.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/javascript_alerts_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           javascript    alerts


*** Test Cases ***
JS Alert Can Be Accepted
    [Documentation]    Verifies clicking the JS Alert button fires an alert which can be accepted.
    [Tags]    smoke
    Open JavaScript Alerts Page
    Trigger JS Alert And Accept
    Verify Result Text    You successfully clicked an alert

JS Confirm Accept Shows OK Result
    [Documentation]    Verifies accepting a JS confirm dialog shows the OK result message.
    [Tags]    smoke
    Open JavaScript Alerts Page
    Trigger JS Confirm And Accept
    Verify Result Text    You clicked: Ok

JS Confirm Dismiss Shows Cancel Result
    [Documentation]    Verifies dismissing a JS confirm dialog shows the Cancel result message.
    [Tags]    smoke
    Open JavaScript Alerts Page
    Trigger JS Confirm And Dismiss
    Verify Result Text    You clicked: Cancel

JS Prompt With Text Shows Entered Value
    [Documentation]    Verifies entering text in a JS prompt dialog displays the entered text in the result.
    [Tags]    smoke
    Open JavaScript Alerts Page
    Trigger JS Prompt And Enter Text    Robot Framework
    Verify Result Text    You entered: Robot Framework

JS Prompt Empty Returns Null
    [Documentation]    Verifies dismissing a JS prompt dialog shows null in the result.
    [Tags]    regression
    Open JavaScript Alerts Page
    Handle Future Dialogs    action=dismiss
    Click    ${PROMPT_BUTTON}
    Verify Result Text    You entered: null
