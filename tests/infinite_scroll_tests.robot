*** Settings ***
Documentation       Infinite Scroll tests — verifies new content loads as the page is scrolled down.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/infinite_scroll_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           dynamic    infinite-scroll    smoke


*** Test Cases ***
Page Loads With Initial Content
    [Documentation]    Verifies the infinite scroll page renders with a content container.
    Open Infinite Scroll Page
    ${count}=    Get Element Count    div#content
    Should Be True    ${count} > 0

Scrolling Loads Additional Content
    [Documentation]    Verifies scrolling down loads more paragraph content via infinite scroll.
    Open Infinite Scroll Page
    Wait For More Paragraphs
