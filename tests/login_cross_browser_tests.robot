*** Settings ***
Documentation       Login tests across all Playwright browsers (chromium, firefox, webkit)

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/login_keywords.resource


*** Test Cases ***
Login With Valid Credentials - Chromium
    [Tags]    smoke    cross-browser    chromium
    Login Scenario    ${USERNAME}    ${PASSWORD}    You logged into a secure area!
    ...    browser=chromium

Login With Invalid Username - Chromium
    [Tags]    regression    cross-browser    chromium
    Login Scenario    invalid_user    ${PASSWORD}    Your username is invalid!
    ...    browser=chromium

Login With Invalid Password - Chromium
    [Tags]    regression    cross-browser    chromium
    Login Scenario    ${USERNAME}    invalid_pass    Your password is invalid!
    ...    browser=chromium

Login With Valid Credentials - Firefox
    [Tags]    smoke    cross-browser    firefox
    Login Scenario    ${USERNAME}    ${PASSWORD}    You logged into a secure area!
    ...    browser=firefox

Login With Invalid Username - Firefox
    [Tags]    regression    cross-browser    firefox
    Login Scenario    invalid_user    ${PASSWORD}    Your username is invalid!
    ...    browser=firefox

Login With Invalid Password - Firefox
    [Tags]    regression    cross-browser    firefox
    Login Scenario    ${USERNAME}    invalid_pass    Your password is invalid!
    ...    browser=firefox

Login With Valid Credentials - WebKit
    [Tags]    smoke    cross-browser    webkit
    Login Scenario    ${USERNAME}    ${PASSWORD}    You logged into a secure area!
    ...    browser=webkit

Login With Invalid Username - WebKit
    [Tags]    regression    cross-browser    webkit
    Login Scenario    invalid_user    ${PASSWORD}    Your username is invalid!
    ...    browser=webkit

Login With Invalid Password - WebKit
    [Tags]    regression    cross-browser    webkit
    Login Scenario    ${USERNAME}    invalid_pass    Your password is invalid!
    ...    browser=webkit
