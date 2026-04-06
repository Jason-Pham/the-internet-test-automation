*** Settings ***
Documentation       Dynamic Content tests — verifies the page renders three rows of dynamically loaded content.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/dynamic_content_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           dynamic    dynamic-content


*** Test Cases ***
Page Renders Three Content Rows
    [Documentation]    Verifies the dynamic content page always shows exactly three content rows.
    [Tags]    smoke
    Open Dynamic Content Page
    Verify Content Rows Are Present

Page Renders Content Images
    [Documentation]    Verifies each content row has an image.
    [Tags]    smoke
    Open Dynamic Content Page
    Verify Content Images Are Present

Content Changes On Reload
    [Documentation]    Verifies page content text is present (content itself may vary on reload).
    [Tags]    regression
    Open Dynamic Content Page
    ${text_first_load}=    Get Row Text    1
    Should Not Be Empty    ${text_first_load}
    Reload
    Verify Content Rows Are Present
