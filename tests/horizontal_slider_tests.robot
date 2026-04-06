*** Settings ***
Documentation       Horizontal Slider tests — verifies the range slider can be set to specific values.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/horizontal_slider_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           mouse-interaction    horizontal-slider


*** Test Cases ***
Slider Is Present On Page
    [Documentation]    Verifies the range slider element is visible on the page.
    [Tags]    smoke
    Open Horizontal Slider Page
    Wait For Elements State    ${SLIDER}    visible

Set Slider To Value Two Point Five
    [Documentation]    Sets the slider to 2.5 and verifies the displayed value updates.
    [Tags]    smoke
    Open Horizontal Slider Page
    Set Slider Value Via JavaScript    2.5
    Verify Slider Display Value    2.5

Set Slider To Minimum Value 0
    [Documentation]    Sets the slider to 0 and verifies the displayed value shows 0.
    [Tags]    regression
    Open Horizontal Slider Page
    Set Slider Value Via JavaScript    0
    Verify Slider Display Value    0

Set Slider To Maximum Value 5
    [Documentation]    Sets the slider to 5 and verifies the displayed value shows 5.
    [Tags]    regression
    Open Horizontal Slider Page
    Set Slider Value Via JavaScript    5
    Verify Slider Display Value    5
