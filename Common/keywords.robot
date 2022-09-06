*** Keywords ***
Open Browser And Login To Intranet
    Open Browser    ${url}    ${browser_name}
    Wait Until Element Is Visible   ${CSS_ElementVisible}      timeout=50
    Input Text          ${CSS_Email}   ${EmailId}
    Wait Until Element Is Visible   ${CSS_ElementVisible}     timeout=50
    click button       ${CSS_SelectNext}
    Wait Until Element Is Visible  ${CSS_PswdElementVisible}    timeout=50
    Input Password      ${CSS_Password}	                   ${Password}
    Wait Until Element Is Visible   ${CSS_PswdElementVisible}      timeout=50
    Click Button        ${CSS_SelectNext}	
    Click Button        ${CSS_SelectNext}

Sign Out And Close Browser
    Click Link		${CSS_LogoutLink}
    Close Browser






