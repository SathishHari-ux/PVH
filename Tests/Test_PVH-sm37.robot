*** Settings ***
Resource    ../Tests/Resource/PVH-sm37.robot
Suite Setup    PVH-sm37.System Logon
Suite Teardown    PVH-sm37.System Logout
Test Tags    pvh-sm37

*** Test Cases ***
PVH-sm37
    PVH-sm37