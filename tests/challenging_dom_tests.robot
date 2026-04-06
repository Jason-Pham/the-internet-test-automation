*** Settings ***
Documentation       Challenging DOM tests — verifies interaction with a page
...                 whose DOM is designed to challenge automation.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/challenging_dom_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           navigation    challenging-dom


*** Test Cases ***
Page Loads With Table
    [Documentation]    Verifies the challenging DOM page renders with a data table.
    [Tags]    smoke
    Open Challenging DOM Page
    Verify Table Has Rows

Blue Button Is Clickable
    [Documentation]    Verifies the blue button can be clicked without error.
    [Tags]    smoke
    Open Challenging DOM Page
    Click Blue Button

Red Button Is Clickable
    [Documentation]    Verifies the red alert button can be clicked without error.
    [Tags]    regression
    Open Challenging DOM Page
    Click Red Button

Table Header Shows Lorem Column
    [Documentation]    Verifies the first column header contains expected text.
    [Tags]    regression
    Open Challenging DOM Page
    Verify Table Header Text    Lorem
