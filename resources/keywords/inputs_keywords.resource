*** Settings ***
Documentation       Inputs Keywords

Library             Browser
Resource            ../locators/inputs_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open Inputs Page
    [Documentation]    Opens the browser and navigates to the inputs page.
    New Page    ${URL_INPUTS}

Type Number In Input
    [Documentation]    Types a numeric value into the number input field.
    [Arguments]    ${number}
    Click    ${NUMBER_INPUT}
    Fill Text    ${NUMBER_INPUT}    ${number}

Press Arrow Up
    [Documentation]    Presses the up arrow key on the number input to increment the value.
    Focus    ${NUMBER_INPUT}
    Keyboard Key    press    ArrowUp

Press Arrow Down
    [Documentation]    Presses the down arrow key on the number input to decrement the value.
    Focus    ${NUMBER_INPUT}
    Keyboard Key    press    ArrowDown

Get Input Value
    [Documentation]    Returns the current value of the number input.
    ${value}=    Get Property    ${NUMBER_INPUT}    value
    RETURN    ${value}
