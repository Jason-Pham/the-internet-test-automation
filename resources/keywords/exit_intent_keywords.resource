*** Settings ***
Documentation       Exit Intent Keywords

Library             Browser
Resource            ../locators/exit_intent_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Exit Intent Page
    [Documentation]    Opens the browser and navigates to the exit intent page.
    New Page    ${URL_EXIT_INTENT}

Trigger Exit Intent Via JavaScript
    [Documentation]    Fires a mouseout event on the document to simulate the user leaving the page.
    Evaluate JavaScript    ${None}
    ...    () => { document.documentElement.dispatchEvent(
    ...    new MouseEvent('mouseout', {bubbles: true, cancelable: true, relatedTarget: null})); }

Verify Exit Intent Modal Is Visible
    [Documentation]    Verifies the exit intent modal appears.
    Wait For Elements State    ${MODAL}    visible    timeout=10s

Close Exit Intent Modal
    [Documentation]    Clicks the close link on the exit intent modal.
    Click    ${MODAL_CLOSE}

Verify Exit Intent Modal Is Closed
    [Documentation]    Verifies the exit intent modal is no longer visible.
    Wait For Elements State    ${MODAL}    hidden    timeout=10s
