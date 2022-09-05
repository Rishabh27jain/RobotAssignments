*** Keywords ***

Open The Browser And Login To Intranet
    open browser    ${url}    ${browser_name}
    Wait Until Element Is Visible   id:cantAccessAccount      timeout=50
    Input Text          xpath://*[@type='email']    ${username}
    click button        id:idSIButton9
    input password      id:i0118                    ${password}
    Wait Until Element Is Visible   id:idA_PWD_ForgotPassword      timeout=50
    click button        xpath://input[@id="idSIButton9"]
    Wait Until Element is Visible   id:displayName             timeout=50
    click button        id:idSIButton9

Close Browser Session
    Click Link		https://intranet.einfochips.com/employee_intranet/portal/auth/logout
    Close Browser






