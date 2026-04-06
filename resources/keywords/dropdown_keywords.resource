*** Settings ***
Documentation       Dropdown Keywords

Library             Browser
Resource            ../locators/dropdown_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Dropdown Page
    [Documentation]    Opens the browser and navigates to the dropdown page.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${URL_DROPDOWN}

Select Dropdown Option
    [Documentation]    Selects an option from the dropdown by its value.
    [Arguments]    ${value}
    Select Options By    ${DROPDOWN}    value    ${value}

Verify Selected Option
    [Documentation]    Verifies that the dropdown currently shows the expected option selected.
    [Arguments]    ${expected_label}
    ${selected}=    Get Selected Options    ${DROPDOWN}    label
    Should Be Equal    ${selected}[0]    ${expected_label}
