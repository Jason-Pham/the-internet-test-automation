*** Settings ***
Documentation       A/B Testing Keywords

Library             Browser
Resource            ../locators/ab_testing_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open AB Test Page
    [Documentation]    Opens the browser and navigates to the A/B test page.
    New Page    ${URL_ABTEST}

Verify AB Test Heading Is Valid
    [Documentation]    Verifies the page heading is one of the two valid A/B test variants.
    ${heading}=    Get Text    ${ABTEST_HEADING}
    Should Match Regexp    ${heading}    ^(A/B Test Control|A/B Test Variation 1)$
