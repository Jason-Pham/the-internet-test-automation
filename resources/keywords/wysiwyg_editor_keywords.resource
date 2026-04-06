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
    [Documentation]    Sets the TinyMCE editor content by manipulating the body DOM directly.
    [Arguments]    ${text}
    Evaluate JavaScript    ${None}
    ...    (_, t) => tinymce.activeEditor.getBody().innerHTML = '<p>' + t + '</p>'    arg=${text}

Verify Editor Contains Text
    [Documentation]    Verifies the WYSIWYG editor body contains the expected text.
    [Arguments]    ${expected_text}
    ${content}=    Get Editor Text
    Should Contain    ${content}    ${expected_text}

Get Editor Text
    [Documentation]    Returns the current plain-text content of the WYSIWYG editor.
    ${text}=    Evaluate JavaScript    ${None}
    ...    () => tinymce.activeEditor.getBody().innerText.trim()
    RETURN    ${text}
