*** Settings ***
Documentation       Challenging DOM Keywords

Library             Browser
Resource            ../locators/challenging_dom_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Challenging DOM Page
    [Documentation]    Opens the browser and navigates to the challenging DOM page.
    New Page    ${URL_CHALLENGING_DOM}
    Wait For Load State    domcontentloaded    timeout=30s
    Wait For Elements State    ${BLUE_BUTTON}    visible    timeout=30s

Click Blue Button
    [Documentation]    Clicks the blue (primary) button.
    Click    ${BLUE_BUTTON}

Click Red Button
    [Documentation]    Clicks the red (alert) button.
    Click    ${RED_BUTTON}

Verify Table Has Rows
    [Documentation]    Verifies the table contains data rows.
    ${count}=    Get Element Count    ${TABLE_ROWS}
    Should Be True    ${count} > 0

Verify Table Header Text
    [Documentation]    Verifies the first column header has the expected text.
    [Arguments]    ${expected_text}
    Wait For Elements State    ${TABLE_HEADER}    visible    timeout=10s
    Get Text    ${TABLE_HEADER}    ==    ${expected_text}
