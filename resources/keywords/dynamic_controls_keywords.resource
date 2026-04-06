*** Settings ***
Documentation       Dynamic Controls Keywords

Library             Browser
Resource            ../locators/dynamic_controls_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Dynamic Controls Page
    [Documentation]    Opens the browser and navigates to the dynamic controls page.
    New Page    ${URL_DYNAMIC_CONTROLS}

Toggle Checkbox And Wait
    [Documentation]    Clicks the toggle button for the checkbox and waits for the action to complete.
    Click    ${TOGGLE_CHECKBOX_BUTTON}
    Wait For Elements State    ${CHECKBOX_MESSAGE}    visible    timeout=10s

Toggle Input And Wait
    [Documentation]    Clicks the enable/disable button for the input and waits for the action to complete.
    Click    ${TOGGLE_INPUT_BUTTON}
    Wait For Elements State    ${INPUT_MESSAGE}    visible    timeout=10s

Verify Input Is Enabled
    [Documentation]    Verifies the text input field is enabled.
    Wait For Elements State    ${INPUT_FIELD}    enabled    timeout=10s

Verify Input Is Disabled
    [Documentation]    Verifies the text input field is disabled.
    Wait For Elements State    ${INPUT_FIELD}    disabled    timeout=10s

Verify Message Text
    [Documentation]    Verifies the status message contains the expected text.
    [Arguments]    ${locator}    ${expected_text}
    Get Text    ${locator}    *=    ${expected_text}
