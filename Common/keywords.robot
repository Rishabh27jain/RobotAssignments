*** Keywords ***

Open The Browser And Login To Intranet
    open browser    ${url}    ${browser_name}
    Wait Until Element Is Visible   ${CSS_ElementVisible}      timeout=50
    Input Text          ${CSS_Email}   ${EmailId}
    Wait Until Element Is Visible   ${CSS_ElementVisible}     timeout=50
    click button       ${CSS_SelectNext}
    Wait Until Element Is Visible  ${CSS_PswdElementVisible}    timeout=50
    input password      ${CSS_Password}	                   ${Password}
    Wait Until Element Is Visible   ${CSS_PswdElementVisible}      timeout=50
    click button        ${CSS_SelectNext}	
    click button        ${CSS_SelectNext}

Close Browser Session
    Click Link		${CSS_LogoutLink}
    Close Browser






