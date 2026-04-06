*** Settings ***
Documentation       Shadow DOM Keywords

Library             Browser
Resource            ../locators/shadow_dom_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Shadow DOM Page
    [Documentation]    Opens the browser and navigates to the shadow DOM page.
    New Page    ${URL_SHADOW_DOM}

Get Shadow DOM Paragraph Text
    [Documentation]    Returns text from a paragraph inside a shadow DOM host element via JavaScript.
    [Arguments]    ${nth}=1
    ${text}=    Evaluate JavaScript    ${None}
    ...    (_, n) => { var hosts = document.querySelectorAll('my-paragraph');
    ...    var host = hosts[n - 1]; return host && host.shadowRoot
    ...    ? host.shadowRoot.querySelector('p').textContent : ''; }
    ...    arg=${nth}
    RETURN    ${text}

Verify Shadow DOM Contains Text
    [Documentation]    Verifies a shadow DOM element's text contains the expected content.
    [Arguments]    ${nth}    ${expected_text}
    ${text}=    Get Shadow DOM Paragraph Text    ${nth}
    Should Contain    ${text}    ${expected_text}
