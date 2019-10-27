*** Settings ***
Library    SeleniumLibrary    

*** Keywords ***
Add product to shopping cart
    Maximize Browser Window
    [Arguments]    ${product_id}
    Mouse Over    xpath:(//div[@class="product-image-container"])[${product_id}]
    Click Link	CSS:ul#homefeatured a[data-id-product="${product_id}"]
    
Checkout product
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5 seconds
    Click Link    css:a[title="Proceed to checkout"]