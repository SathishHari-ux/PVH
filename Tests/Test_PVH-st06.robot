*** Settings ***
Resource    ../Tests/Resource/PVH-st06.robot
Suite Setup    PVH-st06.System Logon
Suite Teardown    PVH-st06.System Logout
Test Tags    pvh-st06

*** Test Cases ***
PVH-st06
    PVH-st06