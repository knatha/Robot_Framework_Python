*** Settings ***
Library    Browser

*** Keywords ***
Assert Item Visible In Cart
    [Arguments]    ${name}
    Wait For Elements State    xpath=//div[@class="cart_item"]//div[text()="${name}"]    visible

Checkout
    Click    id=checkout
