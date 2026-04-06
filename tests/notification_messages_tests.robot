*** Settings ***
Documentation       Notification Messages tests — verifies the flash notification message after clicking a link.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/notification_messages_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           navigation    notification-messages


*** Test Cases ***
Notification Link Is Present
    [Documentation]    Verifies the "Click here" link is visible on the page.
    [Tags]    smoke
    Open Notification Messages Page
    Wait For Elements State    ${CLICK_HERE_LINK}    visible

Click Link Shows Flash Message
    [Documentation]    Verifies clicking the link displays a flash notification message.
    [Tags]    smoke
    Open Notification Messages Page
    Click Notification Link
    Verify Flash Message Is Visible

Flash Message Contains Valid Text
    [Documentation]    Verifies the flash message text is one of the expected notification variants.
    [Tags]    smoke
    Open Notification Messages Page
    Click Notification Link
    Verify Flash Message Contains Valid Text

Multiple Clicks Each Show A Message
    [Documentation]    Verifies clicking the notification link multiple times always shows a flash message.
    [Tags]    regression
    Open Notification Messages Page
    Click Notification Link
    Verify Flash Message Is Visible
    Click Notification Link
    Verify Flash Message Is Visible
