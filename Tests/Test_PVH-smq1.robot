*** Settings ***
Resource    ../Tests/Resource/PVH-smq1.robot
Suite Setup    PVH-smq1.System Logon
Suite Teardown    PVH-smq1.System Logout
Test Tags    pvh-smq1

*** Test Cases ***
PVH-smq1
    PVH-smq1