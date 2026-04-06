*** Settings ***
Documentation       Disappearing Elements Keywords

Library             Browser
Resource            ../locators/disappearing_elements_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Disappearing Elements Page
    [Documentation]    Opens the browser and navigates to the disappearing elements page.
    New Page    ${URL_DISAPPEARING_ELEMENTS}

Verify Nav Menu Is Visible
    [Documentation]    Verifies the top navigation menu is visible on the page.
    Wait For Elements State    ${HOME_LINK}    visible

Verify Home Link Exists
    [Documentation]    Verifies the Home link is always present in the nav.
    Wait For Elements State    ${HOME_LINK}    visible

Get Nav Item Count
    [Documentation]    Returns the number of items currently in the nav menu.
    ${count}=    Get Element Count    ${NAV_ITEMS}
    RETURN    ${count}
