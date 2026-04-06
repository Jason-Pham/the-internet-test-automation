*** Settings ***
Documentation       JavaScript Alerts Locators


*** Variables ***
${ALERT_BUTTON}      button[onclick='jsAlert()']
${CONFIRM_BUTTON}    button[onclick='jsConfirm()']
${PROMPT_BUTTON}     button[onclick='jsPrompt()']
${RESULT_TEXT}       id=result
