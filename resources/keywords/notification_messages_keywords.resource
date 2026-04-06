*** Settings ***
Documentation       Notification Messages Keywords

Library             Browser
Resource            ../locators/notification_messages_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Notification Messages Page
    [Documentation]    Opens the browser and navigates to the notification messages page.
    New Page    ${URL_NOTIFICATION_MESSAGES}

Click Notification Link
    [Documentation]    Clicks the "Click here" link to trigger a notification message.
    Click    ${CLICK_HERE_LINK}

Verify Flash Message Is Visible
    [Documentation]    Verifies the flash notification message is displayed.
    Wait For Elements State    ${FLASH_MESSAGE}    visible    timeout=5s

Verify Flash Message Contains Valid Text
    [Documentation]    Verifies the flash message contains one of the expected notification texts.
    ${text}=    Get Text    ${FLASH_MESSAGE}
    Should Match Regexp    ${text}    (Action successful|Action unsuccesful, please try again)
