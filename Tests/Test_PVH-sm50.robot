*** Settings ***
Resource    ../Tests/Resource/PVH-sm50.robot
Suite Setup    PVH-sm50.System Logon
Suite Teardown    PVH-sm50.System Logout
Test Tags    pvh-sm50

*** Test Cases ***
PVH-sm50
    PVH-sm50