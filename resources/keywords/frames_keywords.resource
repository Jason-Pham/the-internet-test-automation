*** Settings ***
Documentation       Frames (iFrame) Keywords

Library             Browser
Resource            ../locators/frames_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Frames Page
    [Documentation]    Opens the browser and navigates to the iframe page.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${URL_FRAMES}

Clear Editor Content
    [Documentation]    Selects all content in the TinyMCE iframe editor and deletes it.
    Click    ${IFRAME} >>> ${IFRAME_BODY}
    Keyboard Key    press    Control+a
    Keyboard Key    press    Delete

Type In Editor
    [Documentation]    Types text into the TinyMCE iframe editor.
    [Arguments]    ${text}
    Click    ${IFRAME} >>> ${IFRAME_BODY}
    Keyboard Key    press    Control+a
    Keyboard Key    press    Delete
    Type Text    ${IFRAME} >>> ${IFRAME_BODY}    ${text}

Verify Editor Content
    [Documentation]    Verifies the text content inside the TinyMCE iframe editor.
    [Arguments]    ${expected_text}
    Get Text    ${IFRAME} >>> ${IFRAME_BODY}    *=    ${expected_text}
