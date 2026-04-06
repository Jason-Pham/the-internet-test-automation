*** Settings ***
Documentation       Frames (iFrame) Keywords

Library             Browser
Resource            ../locators/frames_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Frames Page
    [Documentation]    Opens the browser and navigates to the iframe page.
    New Page    ${URL_FRAMES}
    Wait For Load State    networkidle    timeout=30s
    Wait For Elements State    ${IFRAME}    visible    timeout=15s
    Wait Until Keyword Succeeds    30x    2s    Verify TinyMCE Is Initialized

Verify TinyMCE Is Initialized
    [Documentation]    Verifies TinyMCE is fully initialised and its body is ready.
    ${ready}=    Evaluate JavaScript    ${None}
    ...    () => !!(window.tinymce && tinymce.activeEditor && tinymce.activeEditor.initialized)
    Should Be True    ${ready}    TinyMCE not yet initialized

Type In Editor
    [Documentation]    Sets TinyMCE editor content directly via the editor body's innerHTML.
    [Arguments]    ${text}
    Evaluate JavaScript    ${None}    () => tinymce.activeEditor.getBody().innerHTML = '<p>${text}</p>'

Verify Editor Content
    [Documentation]    Verifies the text content inside the TinyMCE iframe editor.
    [Arguments]    ${expected_text}
    ${content}=    Evaluate JavaScript    ${None}
    ...    () => tinymce.activeEditor.getBody().textContent.trim()
    Should Contain    ${content}    ${expected_text}
