*** Settings ***
Documentation       Horizontal Slider Keywords

Library             Browser
Resource            ../locators/horizontal_slider_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Horizontal Slider Page
    [Documentation]    Opens the browser and navigates to the horizontal slider page.
    New Page    ${URL_HORIZONTAL_SLIDER}

Set Slider Value Via JavaScript
    [Documentation]    Sets the slider to a specific value using JavaScript and fires the change event.
    [Arguments]    ${value}
    Evaluate JavaScript    ${None}
    ...    (_, v) => { var el = document.querySelector("input[type='range']");
    ...    el.value = v; el.dispatchEvent(new Event('change', {bubbles: true}));
    ...    el.dispatchEvent(new Event('input', {bubbles: true})); }
    ...    arg=${value}

Verify Slider Display Value
    [Documentation]    Verifies the displayed range value matches the expected text.
    [Arguments]    ${expected_value}
    Get Text    ${SLIDER_VALUE}    ==    ${expected_value}
