*** Settings ***
Documentation       Nested Frames tests — verifies interaction with nested frame elements.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/nested_frames_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           frames    nested-frames


*** Test Cases ***
Top Frame Is Present
    [Documentation]    Verifies the top frameset frame is present on the page.
    [Tags]    smoke
    Open Nested Frames Page
    Wait For Elements State    ${FRAME_TOP}    attached

Bottom Frame Shows BOTTOM Text
    [Documentation]    Verifies the bottom frame contains the text BOTTOM.
    [Tags]    smoke
    Open Nested Frames Page
    Verify Bottom Frame Content

Left Frame Shows LEFT Text
    [Documentation]    Verifies the left nested frame contains the text LEFT.
    [Tags]    regression
    Open Nested Frames Page
    Verify Frame Content    ${FRAME_TOP} >>> ${FRAME_LEFT}    LEFT

Middle Frame Shows MIDDLE Text
    [Documentation]    Verifies the middle nested frame contains the text MIDDLE.
    [Tags]    regression
    Open Nested Frames Page
    Verify Frame Content    ${FRAME_TOP} >>> ${FRAME_MIDDLE}    MIDDLE

Right Frame Shows RIGHT Text
    [Documentation]    Verifies the right nested frame contains the text RIGHT.
    [Tags]    regression
    Open Nested Frames Page
    Verify Frame Content    ${FRAME_TOP} >>> ${FRAME_RIGHT}    RIGHT
