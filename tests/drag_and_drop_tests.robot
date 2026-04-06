*** Settings ***
Documentation       Drag and Drop tests — verifies HTML drag and drop functionality.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/drag_and_drop_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           mouse-interaction    drag-and-drop


*** Test Cases ***
Columns Are Present On Page Load
    [Documentation]    Verifies both draggable columns exist on the page.
    [Tags]    smoke
    Open Drag And Drop Page
    Wait For Elements State    ${COLUMN_A}    visible
    Wait For Elements State    ${COLUMN_B}    visible

Column A Header Is Initially A
    [Documentation]    Verifies column A header reads "A" before any drag interaction.
    [Tags]    smoke
    Open Drag And Drop Page
    Verify Column Header Text    ${COLUMN_A_HEADER}    A

Column B Header Is Initially B
    [Documentation]    Verifies column B header reads "B" before any drag interaction.
    [Tags]    smoke
    Open Drag And Drop Page
    Verify Column Header Text    ${COLUMN_B_HEADER}    B

Drag Column A To Column B
    [Documentation]    Drags column A to column B and verifies the columns have swapped.
    [Tags]    regression
    Open Drag And Drop Page
    Drag Column A To Column B
    Verify Column Header Text    ${COLUMN_A_HEADER}    B
    Verify Column Header Text    ${COLUMN_B_HEADER}    A
