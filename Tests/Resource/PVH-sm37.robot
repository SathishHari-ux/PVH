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
PVH-sm37
    Run Transaction    /nsm37
    Sleep    1
    Clear Field Text    wnd[0]/usr/txtBTCH2170-JOBNAME
    Input Text    wnd[0]/usr/txtBTCH2170-JOBNAME	*
	Sleep	2
    Clear Field Text    wnd[0]/usr/txtBTCH2170-USERNAME
	Input Text    wnd[0]/usr/txtBTCH2170-USERNAME	*
	Sleep	2
    Unselect Checkbox	wnd[0]/usr/chkBTCH2170-SCHEDUL	
	Sleep	2
	Unselect Checkbox	wnd[0]/usr/chkBTCH2170-READY	
	Sleep	2
	Unselect Checkbox	wnd[0]/usr/chkBTCH2170-RUNNING	
	Sleep	2
	Unselect Checkbox	wnd[0]/usr/chkBTCH2170-FINISHED
	Sleep	2
    Take Screenshot    005_sm37_01.jpg
    Sleep    1
    Click Element	wnd[0]/tbar[1]/btn[8]
	Sleep	2
    Take Screenshot    006_sm37_02.jpg
    Sleep    1
    Copy Images    ${OUTPUT_DIR}    ${symvar('PVH_Target_Dir')}