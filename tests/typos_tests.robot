*** Settings ***
Documentation       Typos tests — verifies the typos page loads and the second paragraph has expected content shape.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/typos_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           navigation    typos


*** Test Cases ***
Typos Page Loads With Two Paragraphs
    [Documentation]    Verifies the typos page renders exactly two paragraph elements.
    [Tags]    smoke
    Open Typos Page
    Verify Page Loads With Paragraphs

Second Paragraph Contains Core Words Regardless Of Typo
    [Documentation]    Verifies the second paragraph contains expected words even with potential typos.
    [Tags]    smoke
    Open Typos Page
    Verify Second Paragraph Contains Expected Words

First Paragraph Has Expected Content
    [Documentation]    Verifies the first paragraph contains expected introductory text.
    [Tags]    regression
    Open Typos Page
    Get Text    ${FIRST_PARAGRAPH}    *=    This example demonstrates a typo being introduced
