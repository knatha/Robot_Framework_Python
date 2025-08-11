*** Settings ***
Library    Browser

*** Variables ***
${FIRST_NAME}     id=first-name
${LAST_NAME}      id=last-name
${POSTAL_CODE}    id=postal-code
${CONTINUE_BTN}   id=continue
${FINISH_BTN}     id=finish
${BACK_HOME}      id=back-to-products

${LABEL_ITEM_TOTAL}    css=.summary_subtotal_label
${LABEL_TAX}           css=.summary_tax_label
${LABEL_TOTAL}         css=.summary_total_label
${THANK_YOU}           css=.complete-header

*** Keywords ***
Fill Checkout Info
    [Arguments]    ${first}    ${last}    ${zip}
    Fill Text    ${FIRST_NAME}    ${first}
    Fill Text    ${LAST_NAME}     ${last}
    Fill Text    ${POSTAL_CODE}   ${zip}
    Click        ${CONTINUE_BTN}

Finish Order
    Click    ${FINISH_BTN}
    Wait For Elements State    ${THANK_YOU}    visible

Get Amount From Label
    [Arguments]    ${locator}
    ${txt}=    Get Text    ${locator}
    # extracts the number after the last '$'
    ${amount}=    Evaluate    float("${txt}".split('$')[-1])
    RETURN    ${amount}