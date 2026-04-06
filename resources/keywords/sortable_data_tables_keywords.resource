*** Settings ***
Documentation       Sortable Data Tables Keywords

Library             Browser
Resource            ../locators/sortable_data_tables_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Sortable Data Tables Page
    [Documentation]    Opens the browser and navigates to the sortable data tables page.
    New Page    ${URL_TABLES}

Sort Table By Column
    [Documentation]    Clicks a table column header link to sort by that column.
    [Arguments]    ${header_locator}
    Click    ${header_locator}

Get First Row Last Name
    [Documentation]    Returns the last name from the first row of table 1.
    ${text}=    Get Text    ${TABLE_1_FIRST_ROW_LAST}
    RETURN    ${text}

Get First Row First Name
    [Documentation]    Returns the first name from the first row of table 1.
    ${text}=    Get Text    ${TABLE_1_FIRST_ROW_FIRST}
    RETURN    ${text}

Verify Table Has Rows
    [Documentation]    Verifies table 1 contains data rows.
    ${count}=    Get Element Count    ${TABLE_1_ROWS}
    Should Be True    ${count} > 0
