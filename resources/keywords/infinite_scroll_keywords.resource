*** Settings ***
Documentation       Infinite Scroll Keywords

Library             Browser
Resource            ../locators/infinite_scroll_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Infinite Scroll Page
    [Documentation]    Opens the browser and navigates to the infinite scroll page.
    New Page    ${URL_INFINITE_SCROLL}
    Wait For Load State    load    timeout=30s
    Wait For Elements State    div#content    visible    timeout=30s

Get Paragraph Count
    [Documentation]    Returns the current number of paragraph elements loaded on the page.
    ${count}=    Get Element Count    p
    RETURN    ${count}

Scroll Down By Pixels
    [Documentation]    Scrolls the page down by a given number of pixels.
    [Arguments]    ${pixels}=500
    Evaluate JavaScript    ${None}    (_, px) => window.scrollBy(0, px)    arg=${pixels}

Wait For More Paragraphs
    [Documentation]    Retries scrolling to the bottom until jscroll loads additional content.
    Wait Until Keyword Succeeds    10x    3s    Scroll To Bottom And Verify Jscroll Loaded

Scroll To Bottom And Verify Jscroll Loaded
    [Documentation]    Scrolls to the page bottom and asserts jscroll-added content exists.
    Evaluate JavaScript    ${None}    () => window.scrollTo(0, document.body.scrollHeight)
    ${count}=    Get Element Count    div.jscroll-added
    Should Be True    ${count} > 0    jscroll did not load additional content after scrolling
