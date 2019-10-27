*** Settings ***
Library    SeleniumLibrary       

*** Variables ***
${Target URL}    http://automationpractice.com/index.php
${Browser}	googlechrome

*** Keywords ***
eCommerce Suite Setup
    Open Browser	url=${Target URL}	browser=${Browser}
    Maximize Browser Window
    
eCommerce Suite Teardown
    Close All Browsers
    
eCommerce Test Setup
    Delete All Cookies
    Go To	${Target URL}
