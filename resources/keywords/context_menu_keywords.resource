*** Settings ***
Documentation       Context Menu Keywords

Library             Browser
Resource            ../locators/context_menu_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Context Menu Page
    [Documentation]    Opens the browser and navigates to the context menu page.
    New Page    ${URL_CONTEXT_MENU}

Right-Click Hotspot And Handle Alert
    [Documentation]    Right-clicks the hotspot element and accepts the resulting JS alert.
    Handle Future Dialogs    action=accept
    Click    ${CONTEXT_MENU_HOTSPOT}    button=right
