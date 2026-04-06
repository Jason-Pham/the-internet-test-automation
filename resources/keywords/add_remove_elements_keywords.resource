*** Settings ***
Documentation       Add/Remove Elements Keywords

Library             Browser
Resource            ../locators/add_remove_elements_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Add Remove Elements Page
    [Documentation]    Opens the browser and navigates to the add/remove elements page.
    New Page    ${URL_ADD_REMOVE_ELEMENTS}
    Wait For Elements State    ${ADD_ELEMENT_BUTTON}    visible    timeout=30s

Add Element
    [Documentation]    Clicks the Add Element button to add a Delete button.
    Click    ${ADD_ELEMENT_BUTTON}

Remove Element
    [Documentation]    Clicks the first visible Delete button.
    Click    ${DELETE_BUTTON}

Verify Delete Button Count
    [Documentation]    Verifies the number of Delete buttons on the page.
    [Arguments]    ${expected_count}
    ${count}=    Get Element Count    ${DELETE_BUTTON}
    Should Be Equal As Integers    ${count}    ${expected_count}

Verify No Delete Buttons
    [Documentation]    Verifies no Delete buttons are present.
    ${count}=    Get Element Count    ${DELETE_BUTTON}
    Should Be Equal As Integers    ${count}    0
