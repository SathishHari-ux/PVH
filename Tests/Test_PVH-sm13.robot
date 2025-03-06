*** Settings ***
Resource    ../Tests/Resource/PVH-sm13.robot
Suite Setup    PVH-sm13.System Logon
Suite Teardown    PVH-sm13.System Logout
Test Tags    pvh-sm13

*** Test Cases ***
PVH-sm13
    PVH-sm13