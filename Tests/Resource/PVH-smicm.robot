*** Settings ***
Library    Process
Library    SAP_Tcode_Library.py
Library    OperatingSystem
Library    String
Library    DateTime
Library    Merger.py
Library    SAP_Tcode_Library
*** Variables ***
${TREE_PATH}    wnd[2]/usr/tabsVERSDETAILS/tabpCOMP_VERS/ssubDETAIL_SUBSCREEN:SAPLOCS_UI_CONTROLS:0301/cntlSCV_CU_CONTROL/shellcont/shell
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
PVH-smicm
    Click Element	wnd[0]/mbar/menu[4]/menu[11]
	Sleep	1
    Take Screenshot    012_componentversion_01.jpg
    Sleep    1
    Click Element	wnd[1]/usr/btnPRELINFO
	Sleep	1
    Take Screenshot    012_componentversion_02.jpg
    Sleep    1
    ${row_count}    Get Row Count    ${TREE_PATH}
    Log    Total Row Count: ${row_count}
    ${counter}=    Set Variable    1
    FOR    ${i}    IN RANGE    0    ${row_count + 1}    15
        Log    Processing row ${i}
        ${selected_rows}    Selected_rows    ${TREE_PATH}    ${i}
        Log To Console    Selected rows: ${selected_rows}      
        ${padded_counter}=    Evaluate    "{:02d}".format(${counter})
        Take Screenshot    012_componentversion_03_${padded_counter}.jpg
        ${counter}=    Evaluate    ${counter} + 1
        Sleep    1
    END
    Sleep	1
    Click Element	wnd[2]/tbar[0]/btn[0]
	Sleep	1
    Click Element	wnd[1]/tbar[0]/btn[17]
	Sleep	2
    Take Screenshot    012_componentversion_04.jpg
    Sleep    1
	Click Element	wnd[2]/tbar[0]/btn[0]
	Sleep	2
	Click Element	wnd[1]/tbar[0]/btn[0]
	Sleep	2
    Run Transaction    /nsmicm
    Sleep    1
    Take Screenshot    012_smicm_05.jpg
    Sleep    1
    Click Element	wnd[0]/tbar[1]/btn[13]
	Sleep	1
    Take Screenshot    012_smicm_06.jpg
    Sleep    1
    Merger.Copy Images    ${OUTPUT_DIR}    ${symvar('PVH_Target_Dir')}