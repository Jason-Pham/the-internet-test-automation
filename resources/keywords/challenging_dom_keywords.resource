*** Settings ***
Documentation       Challenging DOM Keywords

Library             Browser
Resource            ../locators/challenging_dom_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Challenging DOM Page
    [Documentation]    Opens the browser and navigates to the challenging DOM page. Retries on slow heroku responses.
    Wait Until Keyword Succeeds    3x    5s    Navigate To Challenging DOM And Verify

Navigate To Challenging DOM And Verify
    [Documentation]    Navigates to the challenging DOM page and verifies content loaded.
    New Page    ${URL_CHALLENGING_DOM}
    Wait For Elements State    ${TABLE_ROWS}:first-child    visible    timeout=15s

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
    Get Text    ${TABLE_HEADER}    ==    ${expected_text}
