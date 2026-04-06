*** Settings ***
Documentation       Add/Remove Elements tests — verifies adding and removing dynamic elements.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/add_remove_elements_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           dynamic    add-remove-elements


*** Test Cases ***
Add Single Element
    [Documentation]    Verifies clicking Add Element once adds a Delete button.
    [Tags]    smoke
    Open Add Remove Elements Page
    Add Element
    Verify Delete Button Count    1

Add Multiple Elements
    [Documentation]    Verifies clicking Add Element multiple times creates multiple Delete buttons.
    [Tags]    regression
    Open Add Remove Elements Page
    Add Element
    Add Element
    Add Element
    Verify Delete Button Count    3

Remove Element After Adding
    [Documentation]    Verifies a Delete button can be removed after it is added.
    [Tags]    smoke
    Open Add Remove Elements Page
    Add Element
    Verify Delete Button Count    1
    Remove Element
    Verify No Delete Buttons

Add Then Remove Multiple Elements
    [Documentation]    Verifies adding multiple elements and removing them one by one works correctly.
    [Tags]    regression
    Open Add Remove Elements Page
    Add Element
    Add Element
    Verify Delete Button Count    2
    Remove Element
    Verify Delete Button Count    1
    Remove Element
    Verify No Delete Buttons
