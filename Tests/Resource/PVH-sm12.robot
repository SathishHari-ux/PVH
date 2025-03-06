*** Settings ***
Library    Process
Library    SAP_Tcode_Library.py
Library    OperatingSystem
Library    String
Library    Merger.py
*** Keywords ***
System Logon
    Start Process     ${symvar('SAP_SERVER')}
    Sleep    10s
    Connect To Session
    Open Connection    ${symvar('PVH_connection')}
    Input Text    wnd[0]/usr/txtRSYST-MANDT     ${symvar('PVH_Client_Id')}
    Input Text    wnd[0]/usr/txtRSYST-BNAME    ${symvar('PVH_User_Name')}
    # Input Password   wnd[0]/usr/pwdRSYST-BCODE    ${symvar('PVH_User_Password')}  
    Input Password    wnd[0]/usr/pwdRSYST-BCODE    %{PVH_User_Password}
    Send Vkey    0
    Sleep    3
    Multiple logon Handling     wnd[1]  wnd[1]/usr/radMULTI_LOGON_OPT2  wnd[1]/tbar[0]/btn[0] 
    Sleep   5
System Logout
    Run Transaction     /nex
    Sleep   5
PVH-sm12
    Run Transaction    /nsm12
    Sleep    1
    Clear Field Text    wnd[0]/usr/ctxtSEQG3-GCLIENT
    Input Text    wnd[0]/usr/ctxtSEQG3-GCLIENT	*
	Sleep	2
    Clear Field Text    wnd[0]/usr/txtSEQG3-GUNAME
	Input Text    wnd[0]/usr/txtSEQG3-GUNAME	*
	Sleep	2
    Click Element	wnd[0]/tbar[1]/btn[8]
	Sleep	2
    Take Screenshot    007_sm12_01.jpg
    Sleep    1
    Copy Images    ${OUTPUT_DIR}    ${symvar('PVH_Target_Dir')}