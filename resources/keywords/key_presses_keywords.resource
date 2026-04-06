*** Settings ***
Documentation       Key Presses Keywords

Library             Browser
Resource            ../locators/key_presses_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Key Presses Page
    [Documentation]    Opens the browser and navigates to the key presses page.
    New Page    ${URL_KEY_PRESSES}

Press Key In Input
    [Documentation]    Focuses the input and presses the given key.
    [Arguments]    ${key}
    Click    ${KEY_INPUT}
    Keyboard Key    press    ${key}

Verify Key Result
    [Documentation]    Verifies the result text shows the expected key name.
    [Arguments]    ${expected_key_name}
    Get Text    ${RESULT_TEXT}    *=    ${expected_key_name}
