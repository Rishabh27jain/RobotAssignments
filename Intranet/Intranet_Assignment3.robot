*** Settings ***
Documentation   To validate the Intranet Functionality
Suite Setup      Open Browser And Login To Intranet
Suite Teardown     Sign Out And Close Browser
Resource        ../Common/Resources.robot

*** Test Cases ***
Go To Home And Click Anniversary
    Mouse Over          ${CSS_Cursor}
    Click Element       ${CSS_SelectAnniversary}    

Retrieve Anniversary Records For Today's Date
    @{ActualList}=	    Create List
    Set Global Variable         ${ActualList}
    Mouse Over          ${CSS_Cursor}
    Click Element       ${CSS_SelectAnniversary}
    ${Date}      Get Current Date    result_format=%d
    Select From List By Value        ${CSS_SearchDate}      ${Date}
    @{elements}     Get WebElements    ${CSS_GetAnniversaryName}
    FOR    ${element}    IN     @{elements}
        Append To List    ${ActualList}      ${element.text}
    END

Click On Wishing You Section And Retrieve Records
    Go To             ${Home_Page}
    @{ExpectedList}=	    Create List
    Set Global Variable         ${ExpectedList}
    Click Element       ${CSS_ClickAnniversaryLogo}
    @{elements}     Get WebElements     ${CSS_GetAnniversaryName}
    FOR    ${element}    IN     @{elements}
        Append To List    ${ExpectedList}       ${element.text}
    END

Verify Both Anniversary Records Are Same
   Lists Should Be Equal  ${ActualList}    ${ExpectedList}