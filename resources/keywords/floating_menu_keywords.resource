*** Settings ***
Documentation       Floating Menu Keywords

Library             Browser
Resource            ../locators/floating_menu_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Floating Menu Page
    [Documentation]    Opens the browser and navigates to the floating menu page.
    New Page    ${URL_FLOATING_MENU}

Scroll To Bottom Of Page
    [Documentation]    Scrolls to the bottom of the page using JavaScript.
    Evaluate JavaScript    ${None}    () => window.scrollTo(0, document.body.scrollHeight)

Verify Floating Menu Is Visible
    [Documentation]    Verifies the floating menu remains visible after scrolling.
    Wait For Elements State    ${FLOATING_MENU}    visible

Verify Menu Links Are Visible
    [Documentation]    Verifies all four menu links are visible.
    Wait For Elements State    ${HOME_LINK}       visible
    Wait For Elements State    ${NEWS_LINK}       visible
    Wait For Elements State    ${CONTACT_LINK}    visible
    Wait For Elements State    ${ABOUT_LINK}      visible
