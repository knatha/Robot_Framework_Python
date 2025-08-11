*** Settings ***
Library    Browser

*** Variables ***
${CART_LINK}              css=.shopping_cart_link
${CART_BADGE}             css=.shopping_cart_badge
${SORT_SELECT}            css=.product_sort_container    # dropdown

*** Keywords ***
Open Inventory
    # Inventory grid + sort dropdown visible means we’re on /inventory.html
    Wait For Elements State    css=.inventory_list                      visible    timeout=15s
    Wait For Elements State    ${SORT_SELECT}                           visible    timeout=15s

Add Backpack To Cart
    Click    id=add-to-cart-sauce-labs-backpack

Add Bike Light To Cart
    Click    id=add-to-cart-sauce-labs-bike-light

Remove Backpack From Cart
    Click    id=remove-sauce-labs-backpack

Go To Cart
    Click    ${CART_LINK}

Assert Cart Count Is
    [Arguments]    ${count}
    # Ensure badge appears before reading it
    Wait For Elements State    ${CART_BADGE}    visible    timeout=10s
    ${badge}=    Get Text      ${CART_BADGE}
    Should Be Equal            ${badge}    ${count}

Sort By Price Low To High
    Wait For Elements State    ${SORT_SELECT}    visible    timeout=15s
    # Try label first; if it ever fails, switch to `value    lohi`
    Select Options By          ${SORT_SELECT}    label    Price (low to high)

Assert First Item Price Is
    [Arguments]    ${price}
    # Use a single, unambiguous element to avoid strict-mode violations
    Wait For Elements State    css=.inventory_item_price >> nth=0    visible    timeout=15s
    ${txt}=    Get Text        css=.inventory_item_price >> nth=0
    Should Be Equal            ${txt}    ${price}
