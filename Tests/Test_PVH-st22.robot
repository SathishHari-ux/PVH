*** Settings ***
Resource    ../Tests/Resource/PVH-st22.robot
Suite Setup    PVH-st22.System Logon
Suite Teardown    PVH-st22.System Logout
Test Tags    pvh-st22

*** Test Cases ***
PVH-st22
    PVH-st22