*** Settings ***
Resource    ../Tests/Resource/PVH-sick.robot
Suite Setup    PVH-sick.System Logon
Suite Teardown    PVH-sick.System Logout
Test Tags    pvh-sick

*** Test Cases ***
PVH-sick
    PVH-sick