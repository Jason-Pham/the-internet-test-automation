*** Settings ***
Documentation       WYSIWYG Editor Keywords

Library             Browser
Resource            ../locators/wysiwyg_editor_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open WYSIWYG Editor Page
    [Documentation]    Opens the browser and navigates to the WYSIWYG editor page.
    New Page    ${URL_WYSIWYG_EDITOR}
    Wait For Load State    networkidle    timeout=30s
    Wait For Elements State    ${IFRAME}    visible    timeout=15s
    Wait Until Keyword Succeeds    30x    2s    Verify TinyMCE Is Initialized

Verify TinyMCE Is Initialized
    [Documentation]    Verifies TinyMCE is fully initialised and its body is ready.
    ${ready}=    Evaluate JavaScript    ${None}
    ...    () => !!(window.tinymce && tinymce.activeEditor && tinymce.activeEditor.initialized)
    Should Be True    ${ready}    TinyMCE not yet initialized

Clear And Type In Editor
    [Documentation]    Sets the TinyMCE editor content directly via the editor body's innerHTML.
    [Arguments]    ${text}
    Evaluate JavaScript    ${None}    () => tinymce.activeEditor.getBody().innerHTML = '<p>${text}</p>'

Verify Editor Contains Text
    [Documentation]    Verifies the WYSIWYG editor body contains the expected text.
    [Arguments]    ${expected_text}
    ${content}=    Get Editor Text
    Should Contain    ${content}    ${expected_text}

Get Editor Text
    [Documentation]    Returns the current text content of the WYSIWYG editor body.
    ${text}=    Evaluate JavaScript    ${None}
    ...    () => tinymce.activeEditor.getBody().textContent.trim()
    RETURN    ${text}
