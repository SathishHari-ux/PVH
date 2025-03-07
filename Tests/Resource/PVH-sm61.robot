*** Settings ***
Library    Process
Library    SAP_Tcode_Library.py
Library    OperatingSystem
Library    String
Library    DateTime
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

PVH-sm61
    Run Transaction    /nsm61
    Sleep    1
    Take Screenshot    013_sm61_01.jpg
    Sleep    1
    Click Element	wnd[0]/tbar[1]/btn[14]
	Sleep	1
    Take Screenshot    013_sm61_02.jpg
    Sleep    1
    Merger.Copy Images    ${OUTPUT_DIR}    ${symvar('PVH_Target_Dir')}
    Sleep    1
    Images To Pdf    image_folder=${symvar('PVH_Target_Dir')}    output_pdf=${symvar('PVH_Target_Dir')}//${symvar('PVH_PDFFILE_NAME')}
    Sleep	1