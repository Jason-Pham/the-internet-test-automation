*** Settings ***
Documentation       Typos Keywords

Library             Browser
Resource            ../locators/typos_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Typos Page
    [Documentation]    Opens the browser and navigates to the typos page.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${URL_TYPOS}

Get Second Paragraph Text
    [Documentation]    Returns the text of the second paragraph which may contain a typo.
    ${text}=    Get Text    ${SECOND_PARAGRAPH}
    RETURN    ${text}

Verify Page Loads With Paragraphs
    [Documentation]    Verifies both paragraph elements are present on the page.
    ${count}=    Get Element Count    ${PARAGRAPHS}
    Should Be Equal As Integers    ${count}    2

Verify Second Paragraph Contains Expected Words
    [Documentation]    Verifies the second paragraph contains key expected words regardless of typos.
    ${text}=    Get Second Paragraph Text
    Should Match Regexp    ${text}    (Sometimes you.ll see a typo|Sometimes you'll see a typo)
