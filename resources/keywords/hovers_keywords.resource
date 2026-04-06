*** Settings ***
Documentation       Hovers Keywords

Library             Browser
Resource            ../locators/hovers_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Hovers Page
    [Documentation]    Opens the browser and navigates to the hovers page.
    New Page    ${URL_HOVERS}

Hover Over Figure
    [Documentation]    Hovers over the specified figure element to reveal its caption.
    [Arguments]    ${locator}
    Hover    ${locator}

Verify Figure Caption Is Visible
    [Documentation]    Verifies that a figure's caption overlay is visible after hover.
    [Arguments]    ${caption_locator}
    Wait For Elements State    ${caption_locator}    visible    timeout=15s

Verify Figure Caption Contains Username
    [Documentation]    Verifies the caption contains the expected username text.
    [Arguments]    ${caption_locator}    ${expected_user}
    Get Text    ${caption_locator}    *=    ${expected_user}
