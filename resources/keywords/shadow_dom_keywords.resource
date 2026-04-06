*** Settings ***
Documentation       Shadow DOM Keywords

Library             Browser
Resource            ../locators/shadow_dom_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Shadow DOM Page
    [Documentation]    Opens the browser and navigates to the shadow DOM page.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${URL_SHADOW_DOM}

Get Shadow DOM Paragraph Text
    [Documentation]    Returns the text content of a paragraph inside a shadow DOM host element.
    [Arguments]    ${host_locator}
    ${text}=    Get Text    ${host_locator} >>> p
    RETURN    ${text}

Verify Shadow DOM Contains Text
    [Documentation]    Verifies a shadow DOM element's text contains the expected content.
    [Arguments]    ${host_locator}    ${expected_text}
    ${text}=    Get Shadow DOM Paragraph Text    ${host_locator}
    Should Contain    ${text}    ${expected_text}
