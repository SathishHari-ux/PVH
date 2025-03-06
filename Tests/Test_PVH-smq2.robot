*** Settings ***
Resource    ../Tests/Resource/PVH-smq2.robot
Suite Setup    PVH-smq2.System Logon
Suite Teardown    PVH-smq2.System Logout
Test Tags    pvh-smq2

*** Test Cases ***
PVH-smq2
    PVH-smq2