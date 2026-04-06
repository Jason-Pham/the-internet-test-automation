*** Settings ***
Documentation       A/B Testing tests — verifies the page renders one of the two valid experiment variants.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/ab_testing_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           navigation    ab-testing


*** Test Cases ***
Page Renders Valid AB Test Variant
    [Documentation]    Verifies the A/B test page heading is one of the two valid experiment variants.
    [Tags]    smoke
    New Page    ${URL_ABTEST}
    Verify AB Test Heading Is Valid

Page Title Is The Internet
    [Documentation]    Verifies the page title is set correctly.
    [Tags]    smoke
    New Page    ${URL_ABTEST}
    Get Title    *=    The Internet
