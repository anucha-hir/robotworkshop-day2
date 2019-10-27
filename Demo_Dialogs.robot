*** Settings ***
Library    Dialogs

*** Test Cases ***
Demo pause dialogs
    Log    Step 1
    Dialogs.Pause Execution    Test pause
    Log    Step 2
