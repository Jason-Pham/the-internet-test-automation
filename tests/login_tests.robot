*** Settings ***
Documentation       Login Tests

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/login_keywords.resource

Test Template       Login Scenario


*** Test Cases ***
Login With Valid Credentials
    [Tags]    smoke
    ${USERNAME}    ${PASSWORD}    You logged into a secure area!
Login With Invalid Username
    [Tags]    regression
    invalid_user    ${PASSWORD}    Your username is invalid!
Login With Invalid Password
    [Tags]    regression
    ${USERNAME}    invalid_pass    Your password is invalid!
