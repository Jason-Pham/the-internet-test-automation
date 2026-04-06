*** Settings ***
Documentation       Frames (iFrame) Keywords

Library             Browser
Resource            ../locators/frames_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Frames Page
    [Documentation]    Opens the browser and navigates to the iframe page.
    New Page    ${URL_FRAMES}
    Wait For Elements State    ${IFRAME}    visible    timeout=15s
    Wait Until Keyword Succeeds    10x    1s    Verify TinyMCE Is Ready

Verify TinyMCE Is Ready
    [Documentation]    Verifies TinyMCE has fully initialised.
    ${ready}=    Evaluate JavaScript    ${None}
    ...    () => !!(window.tinymce && tinymce.activeEditor)
    Should Be True    ${ready}    TinyMCE not yet ready

Type In Editor
    [Documentation]    Sets TinyMCE editor content via its JavaScript API.
    [Arguments]    ${text}
    Evaluate JavaScript    ${None}    (_, t) => tinymce.activeEditor.setContent(t)    arg=${text}

Verify Editor Content
    [Documentation]    Verifies the text content inside the TinyMCE iframe editor.
    [Arguments]    ${expected_text}
    ${content}=    Evaluate JavaScript    ${None}    () => tinymce.activeEditor.getContent({format: 'text'})
    Should Contain    ${content}    ${expected_text}
