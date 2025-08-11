*** Settings ***
Library    Browser

*** Variables ***
${BASE_URL}           https://www.saucedemo.com/
${INPUT_USERNAME}     id=user-name
${INPUT_PASSWORD}     id=password
${BUTTON_LOGIN}       id=login-button
${EL_SUCCESS_MARKER}  css=.inventory_list
${EL_ERROR_BANNER}    css=.error-message-container

*** Keywords ***
Open Login Page
    New Page    ${BASE_URL}

Login With Credentials
    [Arguments]    ${username}    ${password}
    Fill Text    ${INPUT_USERNAME}    ${username}
    Fill Text    ${INPUT_PASSWORD}    ${password}
    Click        ${BUTTON_LOGIN}

Assert Login Success
    Wait For Elements State    ${EL_SUCCESS_MARKER}    visible

Assert Login Error
    [Arguments]    ${message_substring}=
    ${text}=    Get Text    ${EL_ERROR_BANNER}
    Run Keyword If    '${message_substring}' != ''    Should Contain    ${text}    ${message_substring}
    ...    ELSE    Should Not Be Empty    ${text}
