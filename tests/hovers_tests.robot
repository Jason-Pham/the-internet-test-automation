*** Settings ***
Documentation       Hovers tests — verifies hovering over images reveals user profile captions.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/hovers_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           mouse-interaction    hovers


*** Test Cases ***
Three Figures Are Present
    [Documentation]    Verifies three hoverable figure elements exist on the page.
    [Tags]    smoke
    Open Hovers Page
    ${count}=    Get Element Count    div.figure
    Should Be Equal As Integers    ${count}    3

Hover Figure 1 Reveals Caption
    [Documentation]    Verifies hovering over the first figure reveals its caption overlay.
    [Tags]    smoke
    Open Hovers Page
    Hover Over Figure    ${FIGURE_1}
    Verify Figure Caption Is Visible    ${FIGURE_CAPTION_1}

Hover Figure 1 Shows User 1
    [Documentation]    Verifies the first figure caption contains user1's profile text.
    [Tags]    smoke
    Open Hovers Page
    Hover Over Figure    ${FIGURE_1}
    Verify Figure Caption Contains Username    ${FIGURE_CAPTION_1}    user1

Hover Figure 2 Shows User 2
    [Documentation]    Verifies the second figure caption contains user2's profile text.
    [Tags]    smoke
    Open Hovers Page
    Hover Over Figure    ${FIGURE_2}
    Verify Figure Caption Contains Username    ${FIGURE_CAPTION_2}    user2

Hover Figure 3 Shows User 3
    [Documentation]    Verifies the third figure caption contains user3's profile text.
    [Tags]    smoke
    Open Hovers Page
    Hover Over Figure    ${FIGURE_3}
    Verify Figure Caption Contains Username    ${FIGURE_CAPTION_3}    user3

Caption Link Navigates To Profile
    [Documentation]    Verifies the profile link in the caption is clickable.
    [Tags]    regression
    Open Hovers Page
    Hover Over Figure    ${FIGURE_1}
    Wait For Elements State    ${FIGURE_LINK_1}    visible
