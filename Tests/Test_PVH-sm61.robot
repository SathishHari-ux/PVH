*** Settings ***
Resource    ../Tests/Resource/PVH-sm61.robot
Suite Setup    PVH-sm61.System Logon
Suite Teardown    PVH-sm61.System Logout
Test Tags    pvh-sm61

*** Test Cases ***
PVH-sm61
    PVH-sm61