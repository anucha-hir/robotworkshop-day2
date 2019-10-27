*** Settings ***
Library    SeleniumLibrary    
Library    String
Resource    resources/Common.resource
Suite Setup    eCommerce Suite Setup   
Suite Teardown    eCommerce Suite Teardown    
Test Setup    eCommerce Test Setup
Test Teardown    Capture Page Screenshot    

*** Variables ***
${Target URL}    http://automationpractice.com/index.php
${Browser}	googlechrome

*** Test Cases ***
Buyer checkout single product should calculate total price and shipping fee correctly
    #Open Browser	url=${Target URL}	browser=${Browser}
    Maximize Browser Window
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    Click Link	CSS:ul#homefeatured a[data-id-product="1"]
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5 seconds
    
    Click Link    css:a[title="Proceed to checkout"]
    
    Wait Until Page Contains    Shopping-cart summary    5s
    
    ${total_product_price} =    Get Text    id:total_product
    ${total_product_price} =    Replace String    ${total_product_price}    $    ${EMPTY}    
    Should Be Equal As Strings    16.51        ${total_product_price}
    
    ${total_shipping_fee} =    Get Text    id:total_shipping
    ${total_shipping_fee} =    Replace String    ${total_shipping_fee}    $    ${EMPTY}  
    Should Be Equal As Strings    2.00        ${total_shipping_fee}
    
    ${total_price} =    Get Text    id:total_price
    ${total_price} =    Replace String    ${total_price}    $    ${EMPTY} 
    Should Be Equal As Strings    18.51        ${total_price}
    
    Close All Browsers
    
Buyer checkout multiple product should calculate total price and shipping fee correctly
    #Open Browser	url=${Target URL}	browser=${Browser}
    #Maximize Browser Window
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    Click Link	CSS:ul#homefeatured a[data-id-product="1"]
    Wait Until Element Is Visible    css:a[title="Proceed to checkout"]    5 seconds
    #Close All Browsers

#*** Keywords ***
#eCommerce Suite Setup
#    Open Browser	url=${Target URL}	browser=${Browser}
#    Maximize Browser Window
    
#eCommerce Test Setup
#    Delete All Cookies
#    Go To	${Target URL}