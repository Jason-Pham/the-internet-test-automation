*** Settings ***
Documentation       Infinite Scroll Keywords

Library             Browser
Resource            ../locators/infinite_scroll_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Infinite Scroll Page
    [Documentation]    Opens the browser and navigates to the infinite scroll page.
    New Page    ${URL_INFINITE_SCROLL}
    Wait For Load State    domcontentloaded    timeout=30s
    Wait For Elements State    div#content    visible    timeout=15s

Get Paragraph Count
    [Documentation]    Returns the current number of paragraph elements loaded on the page.
    ${count}=    Get Element Count    p
    RETURN    ${count}

Scroll Down By Pixels
    [Documentation]    Scrolls the page down by a given number of pixels.
    [Arguments]    ${pixels}=500
    Evaluate JavaScript    ${None}    (_, px) => window.scrollBy(0, px)    arg=${pixels}

Wait For More Paragraphs
    [Documentation]    Scrolls down repeatedly and waits for jscroll-added content to appear.
    Scroll Down By Pixels    1000
    Scroll Down By Pixels    1000
    Wait For Elements State    div.jscroll-added    visible    timeout=30s
