*** Settings ***
Documentation       Login tests across all Playwright browsers (chromium, firefox, webkit)
...                 Verifies valid login, invalid username, and invalid password scenarios.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/login_keywords.resource

Test Tags           cross-browser


*** Test Cases ***
Login With Valid Credentials - Chromium
    [Documentation]    Verifies successful login with valid credentials on Chromium.
    [Tags]    smoke    chromium
    Login Scenario    ${USERNAME}    ${PASSWORD}    You logged into a secure area!
    ...    browser=chromium

Login With Invalid Username - Chromium
    [Documentation]    Verifies error message when an invalid username is submitted on Chromium.
    [Tags]    regression    chromium
    Login Scenario    invalid_user    ${PASSWORD}    Your username is invalid!
    ...    browser=chromium

Login With Invalid Password - Chromium
    [Documentation]    Verifies error message when an invalid password is submitted on Chromium.
    [Tags]    regression    chromium
    Login Scenario    ${USERNAME}    invalid_pass    Your password is invalid!
    ...    browser=chromium

Login With Valid Credentials - Firefox
    [Documentation]    Verifies successful login with valid credentials on Firefox.
    [Tags]    smoke    firefox
    Login Scenario    ${USERNAME}    ${PASSWORD}    You logged into a secure area!
    ...    browser=firefox

Login With Invalid Username - Firefox
    [Documentation]    Verifies error message when an invalid username is submitted on Firefox.
    [Tags]    regression    firefox
    Login Scenario    invalid_user    ${PASSWORD}    Your username is invalid!
    ...    browser=firefox

Login With Invalid Password - Firefox
    [Documentation]    Verifies error message when an invalid password is submitted on Firefox.
    [Tags]    regression    firefox
    Login Scenario    ${USERNAME}    invalid_pass    Your password is invalid!
    ...    browser=firefox

Login With Valid Credentials - WebKit
    [Documentation]    Verifies successful login with valid credentials on WebKit.
    [Tags]    smoke    webkit
    Login Scenario    ${USERNAME}    ${PASSWORD}    You logged into a secure area!
    ...    browser=webkit

Login With Invalid Username - WebKit
    [Documentation]    Verifies error message when an invalid username is submitted on WebKit.
    [Tags]    regression    webkit
    Login Scenario    invalid_user    ${PASSWORD}    Your username is invalid!
    ...    browser=webkit

Login With Invalid Password - WebKit
    [Documentation]    Verifies error message when an invalid password is submitted on WebKit.
    [Tags]    regression    webkit
    Login Scenario    ${USERNAME}    invalid_pass    Your password is invalid!
    ...    browser=webkit
