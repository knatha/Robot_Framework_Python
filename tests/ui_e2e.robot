*** Settings ***
Library    Browser
Library    OperatingSystem
Resource    ../resources/pages/Login.resource
Resource    ../resources/pages/Inventory.resource
Resource    ../resources/pages/Cart.resource
Resource    ../resources/pages/Checkout.resource
Variables   ../variables/env.py

Suite Setup       New Browser    browser=${BROWSER}    headless=${HEADLESS}
Suite Teardown    Close Browser
Test Setup        Open Test Context
Test Teardown     Close Test Context

*** Keywords ***
Open Test Context
    ${vid_dir}=    Set Variable    ${OUTPUT DIR}${/}videos
    ${img_dir}=    Set Variable    ${OUTPUT DIR}${/}screenshots
    Create Directory    ${vid_dir}
    Create Directory    ${img_dir}
    &{VIEWPORT}=    Create Dictionary    width=1280    height=800
    &{SIZE}=        Create Dictionary    width=1280    height=720
    &{VIDEO}=       Create Dictionary    dir=${vid_dir}    size=&{SIZE}
    New Context     viewport=&{VIEWPORT}    recordVideo=&{VIDEO}

Close Test Context
    Run Keyword And Ignore Error    Take Screenshot    fullPage=${True}    filename=${OUTPUT DIR}${/}screenshots${/}${TEST NAME}.png
    Close Context

*** Test Cases ***
Logout after successful login
    Open Login Page
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Assert Login Success
    Click    id=react-burger-menu-btn
    Click    id=logout_sidebar_link
    Wait For Elements State    ${INPUT_USERNAME}    visible

Add two items and verify cart badge
    Open Login Page
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Open Inventory
    Add Backpack To Cart
    Add Bike Light To Cart
    Assert Cart Count Is    2
    Go To Cart
    Assert Item Visible In Cart    Sauce Labs Backpack
    Assert Item Visible In Cart    Sauce Labs Bike Light

Sort low-to-high and verify first price
    Open Login Page
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Open Inventory
    Sort By Price Low To High
    Assert First Item Price Is    $7.99

Complete checkout and validate totals
    Open Login Page
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Open Inventory
    Add Backpack To Cart           # $29.99
    Add Bike Light To Cart         # $9.99
    Go To Cart
    Checkout
    Fill Checkout Info    Kamal    Natha    M1M1M1
    # Validate item total equals sum of line items
    ${item_total}=    Get Amount From Label    ${LABEL_ITEM_TOTAL}
    Should Be Equal As Numbers    ${item_total}    39.98    precision=2
    # (Optional) You can also read ${LABEL_TAX} and ${LABEL_TOTAL} the same way
    Finish Order
