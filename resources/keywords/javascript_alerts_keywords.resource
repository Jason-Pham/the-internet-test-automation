*** Settings ***
Documentation       JavaScript Alerts Keywords

Library             Browser
Resource            ../locators/javascript_alerts_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open JavaScript Alerts Page
    [Documentation]    Opens the browser and navigates to the JavaScript alerts page.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${URL_JAVASCRIPT_ALERTS}

Trigger JS Alert And Accept
    [Documentation]    Clicks the JS Alert button and accepts the dialog.
    Handle Alert    action=accept
    Click    ${ALERT_BUTTON}

Trigger JS Confirm And Accept
    [Documentation]    Clicks the JS Confirm button and accepts the dialog.
    Handle Alert    action=accept
    Click    ${CONFIRM_BUTTON}

Trigger JS Confirm And Dismiss
    [Documentation]    Clicks the JS Confirm button and dismisses the dialog.
    Handle Alert    action=dismiss
    Click    ${CONFIRM_BUTTON}

Trigger JS Prompt And Enter Text
    [Documentation]    Clicks the JS Prompt button, enters text, and accepts the dialog.
    [Arguments]    ${prompt_text}=Robot Framework
    Handle Alert    action=accept    prompt_input=${prompt_text}
    Click    ${PROMPT_BUTTON}

Verify Result Text
    [Documentation]    Verifies the result message contains the expected text.
    [Arguments]    ${expected_text}
    Get Text    ${RESULT_TEXT}    *=    ${expected_text}
