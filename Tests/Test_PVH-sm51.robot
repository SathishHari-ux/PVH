*** Settings ***
Resource    ../Tests/Resource/PVH-sm51.robot
Suite Setup    PVH-sm51.System Logon
Suite Teardown    PVH-sm51.System Logout
Test Tags    pvh-sm51

*** Test Cases ***
PVH-sm51
    PVH-sm51