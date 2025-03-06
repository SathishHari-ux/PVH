*** Settings ***
Resource    ../Tests/Resource/PVH-sm12.robot
Suite Setup    PVH-sm12.System Logon
Suite Teardown    PVH-sm12.System Logout
Test Tags    pvh-sm12

*** Test Cases ***
PVH-sm12
    PVH-sm12