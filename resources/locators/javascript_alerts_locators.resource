*** Settings ***
Documentation       JavaScript Alerts Locators


*** Variables ***
${ALERT_BUTTON}      css:button[onclick='jsAlert()']
${CONFIRM_BUTTON}    css:button[onclick='jsConfirm()']
${PROMPT_BUTTON}     css:button[onclick='jsPrompt()']
${RESULT_TEXT}       id=result
