*** Settings ***
Resource    ../Tests/Resource/PVH-sm58.robot
Suite Setup    PVH-sm58.System Logon
Suite Teardown    PVH-sm58.System Logout
Test Tags    pvh-sm58

*** Test Cases ***
PVH-sm58
    PVH-sm58