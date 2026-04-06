*** Settings ***
Documentation       Checkboxes Keywords

Library             Browser
Resource            ../locators/checkboxes_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Checkboxes Page
    [Documentation]    Opens the browser and navigates to the checkboxes page.
    New Page    ${URL_CHECKBOXES}

Verify Checkbox State
    [Documentation]    Verifies the checked state of a checkbox.
    [Arguments]    ${locator}    ${expected_state}
    ${state}=    Get Checkbox State    ${locator}
    Should Be Equal    ${state}    ${expected_state}
