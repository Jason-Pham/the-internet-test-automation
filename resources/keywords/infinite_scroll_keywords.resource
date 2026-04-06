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
    ${p_count}=    Get Element Count    p
    Log    [infinite-scroll] Page loaded — initial paragraph count: ${p_count}    console=True

Get Paragraph Count
    [Documentation]    Returns the current number of paragraph elements loaded on the page.
    ${count}=    Get Element Count    p
    RETURN    ${count}

Scroll Down By Pixels
    [Documentation]    Scrolls the page down by a given number of pixels.
    [Arguments]    ${pixels}=500
    Evaluate JavaScript    ${None}    (_, px) => window.scrollBy(0, px)    arg=${pixels}

Wait For More Paragraphs
    [Documentation]    Scrolls to the bottom of the page, logs diagnostics, and waits for jscroll content.
    ${before}=    Get Element Count    p
    ${scroll_info}=    Evaluate JavaScript    ${None}
    ...    () => ({ scrollY: window.scrollY, bodyHeight: document.body.scrollHeight,
    ...    viewportHeight: window.innerHeight, jscrollReady: !!window.jQuery && !!jQuery.fn.jscroll })
    Log    [infinite-scroll] Before scroll — paragraphs: ${before} | ${scroll_info}    console=True
    Evaluate JavaScript    ${None}    () => window.scrollTo(0, document.body.scrollHeight)
    ${after_scroll}=    Evaluate JavaScript    ${None}
    ...    () => ({ scrollY: window.scrollY, jscrollAdded: document.querySelectorAll('div.jscroll-added').length })
    Log    [infinite-scroll] After scroll — ${after_scroll}    console=True
    Wait For Elements State    div.jscroll-added    visible    timeout=30s
    ${after}=    Get Element Count    p
    Log    [infinite-scroll] Done — paragraphs after load: ${after}    console=True
