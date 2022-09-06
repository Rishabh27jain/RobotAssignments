*** Settings ***
Documentation   To validate the Intranet Functionality
Test Setup      Open The Browser And Login To Intranet
Test Teardown   Sign Out And Close Browser
Resource        ../Common/Resources.robot

*** Test Cases ***
Go To Home And Click Anniversary 
    Mouse Over          ${CSS_Cursor}	
    Click Element       ${CSS_SelectAnniversary}
    
Retrive Anniversay Records For Today's Date
    @{ActualList}=	    Create List
    Set Global Variable         ${ActualList}
    Mouse Over          ${CSS_Cursor}	
    Click Element       ${CSS_SelectAnniversary}
    Select From List By Value        ${CSS_SearchDate}      06
    @{elements}     Get WebElements    ${CSS_GetAnniversayName}
    FOR    ${element}    IN     @{elements}
        Append To List    ${ActualList}      ${element.text}
    END
   
Click On Wishing You Section And Retrive Records
    @{ExpectedList}=	    Create List
    Set Global Variable         ${ExpectedList}
    Click Element       ${CSS_ClickAnniversayLogo}
    @{elements}     Get WebElements     ${CSS_GetAnniversayName}
    FOR    ${element}    IN     @{elements}
        Append To List    ${ExpectedList}       ${element.text}
    END

Verify Both Anniversary Records Are Same
   Lists Should Be Equal  ${ActualList}    ${ExpectedList}  

















