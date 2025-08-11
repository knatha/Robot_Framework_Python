*** Settings ***
Library    Browser
Resource    ../resources/pages/Login.resource
Variables   ../variables/env.py
Suite Setup       New Browser    headless=${HEADLESS}
Suite Teardown    Close Browser
Test Setup        New Context    viewport={'width': 1280, 'height': 800}
Test Teardown     Close Context

*** Test Cases ***
User can login with valid credentials
    Open Login Page
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login Success

Login fails with invalid credentials
    Open Login Page
    Login With Credentials    ${VALID_USERNAME}    wrong_password
    Assert Login Error        Epic sadface

Data-driven invalid logins
    [Template]    Invalid Login Variant
    wrong_user    ${VALID_PASSWORD}
    ${VALID_USERNAME}    wrong_password
    ${EMPTY}    ${VALID_PASSWORD}
    ${VALID_USERNAME}    ${EMPTY}

*** Keywords ***
Invalid Login Variant
    [Arguments]    ${u}    ${p}
    Open Login Page
    Login With Credentials    ${u}    ${p}
    Assert Login Error
