*** Test Cases ***
Demo scalar
    [Documentation]    
    ...    Test comment
    ...    Test 555
    ${username}    Set Variable    จอห์น
    ${password}    BuiltIn.Set Variable    Welcome1
    Log    Hello ${username} and ${password}
    Log    Hi ${username}
    ${nickname}    Set Variable    Mr. J

Demo List
    @{product_name}    Create List    iPhone 11    Android 12    Window phone
    Log Many    @{product_name}
    Log    ${product_name[1]}
    
Demo Dictionary
    &{user1}    Create Dictionary    username=john    password=welcome1
    &{user2}    Create Dictionary    username=mary    password=welcome2
    Log    ${user1.username}
    Log    ${user2.username}
    
Demo set keywords
    ${hi} =	Set Variable	Hello, world!   
    ${hi2} =	Set Variable	I said: ${hi}   
    ${var1}    ${var2} =	Set Variable	Hello world

