*** Settings ***
Documentation       Broken Images Keywords

Library             Browser
Resource            ../locators/broken_images_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Broken Images Page
    [Documentation]    Opens the browser and navigates to the broken images page.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${URL_BROKEN_IMAGES}

Get Broken Image Count
    [Documentation]    Returns the number of images with naturalWidth of 0 (broken).
    ${broken_count}=    Evaluate JavaScript
    ...    ${ALL_IMAGES}
    ...    (elements) => elements.filter(img => img.naturalWidth === 0).length
    RETURN    ${broken_count}

Verify Page Has Images
    [Documentation]    Verifies the page contains at least one image element.
    ${count}=    Get Element Count    ${ALL_IMAGES}
    Should Be True    ${count} > 0
