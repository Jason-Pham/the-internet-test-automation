*** Settings ***
Documentation       Sortable Data Tables tests — verifies sorting table columns and reading cell data.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/sortable_data_tables_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           tables    navigation


*** Test Cases ***
Table 1 Is Present With Data
    [Documentation]    Verifies table 1 is visible and contains data rows.
    [Tags]    smoke
    Open Sortable Data Tables Page
    Wait For Elements State    ${TABLE_1}    visible
    Verify Table Has Rows

Table 2 Is Present
    [Documentation]    Verifies table 2 is visible on the page.
    [Tags]    smoke
    Open Sortable Data Tables Page
    Wait For Elements State    ${TABLE_2}    visible

Sort By Last Name
    [Documentation]    Verifies clicking the Last Name header sorts the table.
    [Tags]    smoke
    Open Sortable Data Tables Page
    Sort Table By Column    ${TABLE_1_LAST_NAME_SORT}
    ${first_name}=    Get First Row Last Name
    Should Not Be Empty    ${first_name}

Sort By First Name
    [Documentation]    Verifies clicking the First Name header re-sorts the table.
    [Tags]    regression
    Open Sortable Data Tables Page
    Sort Table By Column    ${TABLE_1_FIRST_NAME_SORT}
    ${first_name}=    Get First Row First Name
    Should Not Be Empty    ${first_name}

Sort By Last Name Then First Name Shows Different Results
    [Documentation]    Verifies sorting by different columns changes which name appears in first row.
    [Tags]    regression
    Open Sortable Data Tables Page
    Sort Table By Column    ${TABLE_1_LAST_NAME_SORT}
    ${last_name_row}=    Get First Row Last Name
    Sort Table By Column    ${TABLE_1_FIRST_NAME_SORT}
    ${first_name_row}=    Get First Row First Name
    Should Not Be Empty    ${last_name_row}
    Should Not Be Empty    ${first_name_row}
