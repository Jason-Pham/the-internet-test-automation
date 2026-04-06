*** Settings ***
Documentation       WYSIWYG Editor tests — verifies the TinyMCE rich text editor can be interacted with.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/wysiwyg_editor_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           frames    javascript    wysiwyg


*** Test Cases ***
WYSIWYG Editor Page Loads
    [Documentation]    Verifies the WYSIWYG editor page loads with the TinyMCE iframe visible.
    [Tags]    smoke
    Open WYSIWYG Editor Page
    Wait For Elements State    ${IFRAME}    visible

Type Text In WYSIWYG Editor
    [Documentation]    Verifies text can be entered into the TinyMCE editor.
    [Tags]    smoke
    Open WYSIWYG Editor Page
    Clear And Type In Editor    Hello from Robot Framework
    Verify Editor Contains Text    Hello from Robot Framework

Clear And Replace Editor Content
    [Documentation]    Verifies the editor content can be cleared and replaced with new text.
    [Tags]    regression
    Open WYSIWYG Editor Page
    Clear And Type In Editor    First content
    Clear And Type In Editor    Second content
    Verify Editor Contains Text    Second content

Editor Retains Typed Content
    [Documentation]    Verifies editor content persists after typing without navigating away.
    [Tags]    regression
    Open WYSIWYG Editor Page
    Clear And Type In Editor    Persistent text
    ${text}=    Get Editor Text
    Should Contain    ${text}    Persistent text
