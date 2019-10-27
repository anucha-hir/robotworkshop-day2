*** Settings ***
Library    SeleniumLibrary
Library    String        

*** Keywords ***
Wait until page load success
    Wait Until Page Contains    Shopping-cart summary    5s
    
Verify total product price
    [Arguments]    ${Expected_product_price}
    ${total_product_price} =    Get Text    id:total_product
    ${total_product_price} =    Replace String    ${total_product_price}    $    ${EMPTY}    
    Should Be Equal As Strings    ${Expected_product_price}        ${total_product_price}
    
Verify shipping fee
    [Arguments]    ${Expected_total_shipping_fee}
    ${total_shipping_fee} =    Get Text    id:total_shipping
    ${total_shipping_fee} =    Replace String    ${total_shipping_fee}    $    ${EMPTY}  
    Should Be Equal As Strings    ${Expected_total_shipping_fee}        ${total_shipping_fee}
    
Verify total price
    [Arguments]    ${Expected_total_price}
    ${total_price} =    Get Text    id:total_price
    ${total_price} =    Replace String    ${total_price}    $    ${EMPTY} 
    Should Be Equal As Strings    ${Expected_total_price}        ${total_price}
    
Summary total price
        ${total product} =    Get Text    id:total_product
        ${total shipping} =    Get Text    id:total_shipping
        ${total tax} =    Get Text    id:total_tax   
        ${total price} =    Get Text    id:total_price       
        
        ${total product} =    Replace String    ${total product}    $    ${EMPTY} 
        ${total shipping} =    Replace String    ${total shipping}    $    ${EMPTY} 
        ${total tax} =    Replace String    ${total tax}    $    ${EMPTY} 
        ${total price} =    Replace String    ${total price}    $    ${EMPTY} 
    
        ${total product} =    Convert To Number    ${total product}
        ${total shipping} =    Convert To Number    ${total shipping}
        ${total tax} =    Convert To Number    ${total tax}
        ${total price} =    Convert To Number    ${total price}
        
        ${expected total price} =    Evaluate    ${total product} + ${total shipping} + ${total tax}    
        Should Be Equal As Numbers    ${expected total price}    ${total price}    