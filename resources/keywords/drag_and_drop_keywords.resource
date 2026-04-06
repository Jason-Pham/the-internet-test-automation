*** Settings ***
Documentation       Drag and Drop Keywords

Library             Browser
Resource            ../locators/drag_and_drop_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Drag And Drop Page
    [Documentation]    Opens the browser and navigates to the drag and drop page.
    New Page    ${URL_DRAG_AND_DROP}

Drag Column A To Column B
    [Documentation]    Drags column A onto column B using the Browser library drag and drop.
    Drag And Drop    ${COLUMN_A}    ${COLUMN_B}

Verify Column Header Text
    [Documentation]    Verifies the text content of a column header.
    [Arguments]    ${locator}    ${expected_text}
    Get Text    ${locator}    ==    ${expected_text}
