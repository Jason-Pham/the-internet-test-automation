*** Settings ***
Documentation       Dynamic Content Keywords

Library             Browser
Resource            ../locators/dynamic_content_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Dynamic Content Page
    [Documentation]    Opens the browser and navigates to the dynamic content page.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${URL_DYNAMIC_CONTENT}

Verify Content Rows Are Present
    [Documentation]    Verifies three content rows are rendered on the page.
    ${count}=    Get Element Count    ${CONTENT_ROWS}
    Should Be Equal As Integers    ${count}    3

Verify Content Images Are Present
    [Documentation]    Verifies each content row has an accompanying image.
    ${count}=    Get Element Count    ${CONTENT_IMAGES}
    Should Be True    ${count} >= 3

Get Row Text
    [Documentation]    Returns the text content of the nth content row (1-based).
    [Arguments]    ${row_index}
    ${text}=    Get Text    css:div#content div.row:nth-child(${row_index}) div.large-10
    RETURN    ${text}
