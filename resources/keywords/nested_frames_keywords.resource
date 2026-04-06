*** Settings ***
Documentation       Nested Frames Keywords

Library             Browser
Resource            ../locators/nested_frames_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Nested Frames Page
    [Documentation]    Opens the browser and navigates to the nested frames page.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${URL_NESTED_FRAMES}

Verify Frame Content
    [Documentation]    Reads the body text from a specified frame and verifies its content.
    [Arguments]    ${frame_locator}    ${expected_text}
    ${text}=    Get Text    ${frame_locator} >>> ${FRAME_BODY}
    Should Contain    ${text}    ${expected_text}

Verify Bottom Frame Content
    [Documentation]    Verifies the bottom frame shows BOTTOM text.
    ${text}=    Get Text    ${FRAME_BOTTOM} >>> ${FRAME_BODY}
    Should Contain    ${text}    BOTTOM
