*** Settings ***
Documentation       WYSIWYG Editor Keywords

Library             Browser
Resource            ../locators/wysiwyg_editor_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open WYSIWYG Editor Page
    [Documentation]    Opens the browser and navigates to the WYSIWYG editor page.
    New Page    ${URL_WYSIWYG_EDITOR}
    Wait For Elements State    ${IFRAME}    visible    timeout=15s
    Wait Until Keyword Succeeds    10x    1s    Verify TinyMCE Is Ready

Verify TinyMCE Is Ready
    [Documentation]    Verifies TinyMCE has fully initialised by calling getContent without error.
    ${ready}=    Evaluate JavaScript    ${None}
    ...    () => !!(window.tinymce && tinymce.activeEditor)
    Should Be True    ${ready}    TinyMCE not yet ready

Clear And Type In Editor
    [Documentation]    Sets the TinyMCE editor content via its JavaScript API.
    [Arguments]    ${text}
    Evaluate JavaScript    ${None}    (_, t) => tinymce.activeEditor.setContent(t)    arg=${text}

Verify Editor Contains Text
    [Documentation]    Verifies the WYSIWYG editor body contains the expected text.
    [Arguments]    ${expected_text}
    ${content}=    Get Editor Text
    Should Contain    ${content}    ${expected_text}

Get Editor Text
    [Documentation]    Returns the current plain-text content of the WYSIWYG editor.
    ${text}=    Evaluate JavaScript    ${None}    () => tinymce.activeEditor.getContent({format: 'text'})
    RETURN    ${text}
