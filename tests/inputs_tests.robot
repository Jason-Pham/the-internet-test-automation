*** Settings ***
Documentation       Inputs tests — verifies the HTML5 number input field behavior.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/inputs_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           forms    inputs


*** Test Cases ***
Number Input Is Present
    [Documentation]    Verifies the number input field is visible on the page.
    [Tags]    smoke
    Open Inputs Page
    Wait For Elements State    ${NUMBER_INPUT}    visible

Type A Number In Input
    [Documentation]    Verifies typing a number into the input sets its value correctly.
    [Tags]    smoke
    Open Inputs Page
    Type Number In Input    42
    ${value}=    Get Input Value
    Should Be Equal    ${value}    42

Arrow Up Increments Value
    [Documentation]    Verifies pressing the up arrow key increments the input value.
    [Tags]    regression
    Open Inputs Page
    Type Number In Input    5
    Press Arrow Up
    ${value}=    Get Input Value
    Should Be Equal    ${value}    6

Arrow Down Decrements Value
    [Documentation]    Verifies pressing the down arrow key decrements the input value.
    [Tags]    regression
    Open Inputs Page
    Type Number In Input    5
    Press Arrow Down
    ${value}=    Get Input Value
    Should Be Equal    ${value}    4
