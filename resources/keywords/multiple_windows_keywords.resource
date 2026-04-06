*** Settings ***
Documentation       Multiple Windows Keywords

Library             Browser
Resource            ../locators/multiple_windows_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Multiple Windows Page
    [Documentation]    Opens the browser and navigates to the multiple windows page.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${URL_MULTIPLE_WINDOWS}

Click New Window Link And Switch
    [Documentation]    Clicks the "Click Here" link and switches to the newly opened page.
    ${new_page}=    Promise To Wait For Popup
    Click    ${NEW_WINDOW_LINK}
    ${popup}=    Wait For    ${new_page}
    Switch Page    ${popup}

Verify New Window Heading
    [Documentation]    Verifies the new window heading contains the expected text.
    [Arguments]    ${expected_text}=New Window
    Get Text    ${NEW_WINDOW_HEADING}    *=    ${expected_text}
