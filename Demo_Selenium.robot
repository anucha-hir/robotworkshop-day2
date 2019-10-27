*** Settings ***
Library    SeleniumLibrary    

*** Variables ***
${Target URL}    http://automationpractice.com/index.php
${Browser}	googlechrome

*** Test Cases ***
Open browser demo
        Open Browser	url=${Target URL}	browser=${Browser}
        
Test CSS locator
        Open Browser    url=${Target URL}	browser=${Browser}
        Click Element    css:a.login    
        sleep    3 seconds
        Page Should Contain    Already registered?
        Execute Javascript    