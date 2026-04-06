*** Settings ***
Documentation       Entry Ad Keywords

Library             Browser
Resource            ../locators/entry_ad_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Entry Ad Page
    [Documentation]    Opens the browser and navigates to the entry ad page.
    New Page    ${URL_ENTRY_AD}

Verify Modal Is Visible
    [Documentation]    Verifies the entry ad modal dialog is visible.
    Wait For Elements State    ${MODAL}    visible    timeout=10s

Close Modal
    [Documentation]    Clicks the close link to dismiss the entry ad modal.
    Click    ${MODAL_CLOSE}

Verify Modal Is Closed
    [Documentation]    Verifies the entry ad modal is no longer visible.
    Wait For Elements State    ${MODAL}    hidden    timeout=10s
