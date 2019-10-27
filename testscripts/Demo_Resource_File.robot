*** Settings ***
Library    SeleniumLibrary    
Resource    ../resources/Common.resource
Resource    ../resources/HomePage.resource
Resource    ../resources/OrderPage.resource
Resource    ../stepdefinition/purchase_product_step.resource
Suite Setup    eCommerce Suite Setup 
Suite Teardown    eCommerce Suite Teardown
Test Setup    eCommerce Test Setup
Library    String

*** Test Cases ***
Test import selenium resource file
    Maximize Browser Window
    Mouse Over    xpath:(//div[@class="product-image-container"])[1]
    Click Link	CSS:ul#homefeatured a[data-id-product="1"]
    
Demo page resource
    HomePage.Add product to shopping cart    2
    HomePage.Checkout product

    OrderPage.Wait until page load success   
    OrderPage.Verify total product price    27.00
    OrderPage.Verify shipping fee    2.00
    OrderPage.Verify total price    29.00
    OrderPage.Summary total price
    
Demo math
    ${result}    Evaluate    2+10
    Log    ${result}        

Unauthen user checkout single
    [Tags]    smoketest
    Given Unauthen user add product "2" to shopping cart
    When I checkout product
    Then I should see total product price equal to "27.00"
    #And I should see total product see total shipping fee equal to "2.00"
    #And I should see total product see total total price equal to "2.00"
    #And I should see total product see total shipping fee equal to "2.00"
    

