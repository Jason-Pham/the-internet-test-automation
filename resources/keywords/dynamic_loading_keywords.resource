*** Settings ***
Documentation       Dynamic Loading Keywords

Library             Browser
Resource            ../locators/dynamic_loading_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Dynamic Loading Page
    [Documentation]    Opens the browser and navigates to a dynamic loading example.
    [Arguments]    ${example_url}
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${example_url}

Start Loading
    [Documentation]    Clicks the Start button to begin the dynamic loading sequence.
    Click    ${START_BUTTON}

Wait For Loading To Complete
    [Documentation]    Waits for the loading indicator to disappear and the finish text to appear.
    Wait For Elements State    ${LOADING_BAR}    hidden    timeout=15s
    Wait For Elements State    ${FINISH_TEXT}    visible    timeout=15s

Verify Finish Text
    [Documentation]    Verifies the finish element contains the expected text.
    [Arguments]    ${expected_text}=Hello World!
    Get Text    ${FINISH_TEXT}    *=    ${expected_text}
