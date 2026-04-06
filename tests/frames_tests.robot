*** Settings ***
Documentation       Frames (iFrame) tests — verifies interaction with content inside a TinyMCE iframe editor.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/frames_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           frames    javascript


*** Test Cases ***
IFrame Editor Is Present
    [Documentation]    Verifies the TinyMCE iframe is visible on the page.
    [Tags]    smoke
    Open Frames Page
    Wait For Elements State    ${IFRAME}    visible

Type Text In IFrame Editor
    [Documentation]    Verifies text can be typed inside the TinyMCE iframe editor.
    [Tags]    smoke
    Open Frames Page
    Type In Editor    Hello from Robot Framework
    Verify Editor Content    Hello from Robot Framework

Clear And Retype In IFrame Editor
    [Documentation]    Verifies the editor content can be cleared and replaced with new text.
    [Tags]    regression
    Open Frames Page
    Type In Editor    Initial text
    Type In Editor    Replaced text
    Verify Editor Content    Replaced text
