*** Settings ***
Documentation       Broken Images tests — verifies the page loads and counts broken image resources.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/broken_images_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           navigation    broken-images


*** Test Cases ***
Page Contains Images
    [Documentation]    Verifies the broken images page renders image elements.
    [Tags]    smoke
    Open Broken Images Page
    Verify Page Has Images

Broken Images Are Present
    [Documentation]    Verifies the page has at least one broken image (naturalWidth equals 0).
    [Tags]    regression
    Open Broken Images Page
    ${broken}=    Get Broken Image Count
    Should Be True    ${broken} > 0

Not All Images Are Broken
    [Documentation]    Verifies not every image on the page is broken.
    [Tags]    regression
    Open Broken Images Page
    ${total}=    Get Element Count    ${ALL_IMAGES}
    ${broken}=    Get Broken Image Count
    Should Be True    ${broken} < ${total}
