*** Settings ***
Documentation       Challenging DOM Locators


*** Variables ***
${BLUE_BUTTON}        a.button:not(.alert):not(.success)
${RED_BUTTON}         a.button.alert
${GREEN_BUTTON}       a.button.success
${TABLE_HEADER}       thead tr th:first-child
${TABLE_ROWS}         tbody tr
${CANVAS}             id=canvas
