*** Settings ***
Documentation       Checkboxes Keywords

Library             Browser
Resource            ../locators/checkboxes_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Checkboxes Page
    [Documentation]    Opens the browser and navigates to the checkboxes page.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${URL_CHECKBOXES}

Verify Checkbox State
    [Documentation]    Verifies the checked state of a checkbox.
    [Arguments]    ${locator}    ${expected_state}
    ${state}=    Get Checkbox State    ${locator}
    Should Be Equal    ${state}    ${expected_state}

Check Checkbox
    [Documentation]    Checks a checkbox if it is not already checked.
    [Arguments]    ${locator}
    Check Checkbox    ${locator}

Uncheck Checkbox
    [Documentation]    Unchecks a checkbox if it is checked.
    [Arguments]    ${locator}
    Uncheck Checkbox    ${locator}
