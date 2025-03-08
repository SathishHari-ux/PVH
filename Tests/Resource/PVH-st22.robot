*** Settings ***
Library    Process
Library    SAP_Tcode_Library.py
Library    OperatingSystem
Library    String
Library    Merger.py
*** Variables ***
${TREE_PATH}    wnd[0]/usr/cntlRSSHOWRABAX_ALV_100/shellcont/shell
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
PVH-st22
    Run Transaction    /nst22
    Sleep    1
    Take Screenshot    002_st22_01.jpg
    Sleep    1
    ${number}    Get Value    wnd[0]/usr/txtTOD_NUM 
    ${number}    Evaluate    re.search(r"\\d+", """${number}""").group(0)    re  
    Log    ${number}
    Sleep    1
    IF    ${number} == 0
    Take Screenshot    002_st22_02.jpg
    ELSE
        Click Element    wnd[0]/usr/btnTODAY
        ${row_count}    Get Row Count    ${TREE_PATH}
        Log    Total Row Count: ${row_count}
        ${counter}=    Set Variable    1
        FOR    ${i}    IN RANGE    0    ${row_count + 1}    39
            Log    Processing row ${i}
            ${selected_rows}    Selected_rows    ${TREE_PATH}    ${i}
            Log To Console    Selected rows: ${selected_rows}           
            ${padded_counter}=    Evaluate    "{:02d}".format(${counter})
            Take Screenshot    002_st22_03_${padded_counter}.jpg
            ${counter}=    Evaluate    ${counter} + 1
            Sleep    1
        END
    END
    Copy Images    ${OUTPUT_DIR}    ${symvar('PVH_Target_Dir')}