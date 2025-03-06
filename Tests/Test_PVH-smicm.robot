*** Settings ***
Resource    ../Tests/Resource/PVH-smicm.robot
Suite Setup    PVH-smicm.System Logon
Suite Teardown    PVH-smicm.System Logout
Test Tags    pvh-smicm

*** Test Cases ***
PVH-smicm
    PVH-smicm