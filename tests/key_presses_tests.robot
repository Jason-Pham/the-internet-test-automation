*** Settings ***
Documentation       Key Presses tests — verifies individual key presses are detected and reported correctly.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/key_presses_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           forms    key-presses


*** Test Cases ***
Key Press Input Is Present
    [Documentation]    Verifies the key press input element is visible.
    [Tags]    smoke
    Open Key Presses Page
    Wait For Elements State    ${KEY_INPUT}    visible

Press Enter Key
    [Documentation]    Verifies pressing Enter is detected and the result shows ENTER.
    [Tags]    smoke
    Open Key Presses Page
    Press Key In Input    Enter
    Verify Key Result    ENTER

Press Space Key
    [Documentation]    Verifies pressing Space is detected and the result shows SPACE.
    [Tags]    smoke
    Open Key Presses Page
    Press Key In Input    Space
    Verify Key Result    SPACE

Press Letter A
    [Documentation]    Verifies pressing the letter A is detected correctly.
    [Tags]    regression
    Open Key Presses Page
    Press Key In Input    a
    Verify Key Result    A

Press Tab Key
    [Documentation]    Verifies pressing Tab is detected and the result shows TAB.
    [Tags]    regression
    Open Key Presses Page
    Press Key In Input    Tab
    Verify Key Result    TAB

Press Shift Key
    [Documentation]    Verifies pressing Shift is detected and the result shows SHIFT.
    [Tags]    regression
    Open Key Presses Page
    Press Key In Input    Shift
    Verify Key Result    SHIFT
