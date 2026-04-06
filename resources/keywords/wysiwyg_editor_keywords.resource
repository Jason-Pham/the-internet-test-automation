*** Settings ***
Documentation       WYSIWYG Editor Keywords

Library             Browser
Resource            ../locators/wysiwyg_editor_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open WYSIWYG Editor Page
    [Documentation]    Opens the browser and navigates to the WYSIWYG editor page.
    New Page    ${URL_WYSIWYG_EDITOR}

Clear And Type In Editor
    [Documentation]    Clears the editor content and types new text.
    [Arguments]    ${text}
    Click    ${IFRAME} >>> ${EDITOR_BODY}
    Keyboard Key    press    Control+a
    Keyboard Key    press    Delete
    Type Text    ${IFRAME} >>> ${EDITOR_BODY}    ${text}

Verify Editor Contains Text
    [Documentation]    Verifies the WYSIWYG editor body contains the expected text.
    [Arguments]    ${expected_text}
    Get Text    ${IFRAME} >>> ${EDITOR_BODY}    *=    ${expected_text}

Get Editor Text
    [Documentation]    Returns the current text content of the WYSIWYG editor.
    ${text}=    Get Text    ${IFRAME} >>> ${EDITOR_BODY}
    RETURN    ${text}
