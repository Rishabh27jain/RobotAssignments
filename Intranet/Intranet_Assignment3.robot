*** Settings ***
Documentation   To validate the Intranet Functionality
Test Setup      Open The Browser And Login To Intranet
Test Teardown   Close Browser
Resource        ../Common/Resources.robot

*** Test Cases ***

Go To Home And Click Anniversary 
    mouse over          ${CSS_Cursor}	
    click element       ${CSS_SelectAnniversary}
    
Retrive Anniversay Records For Today's Date
    @{ActualList}=	    create list
    Set Global Variable         ${ActualList}
    mouse over          ${CSS_Cursor}	
    click element       ${CSS_SelectAnniversary}
    select from list by value        ${CSS_SearchDate}      06
    @{elements}     Get WebElements    ${CSS_GetAnniversayName}
    FOR    ${element}    IN     @{elements}
        Append To List    ${ActualList}      ${element.text}
    END
   
Click On Wishing You Section And Retrive Records
    @{ExpectedList}=	    create list
    Set Global Variable         ${ExpectedList}
    click element       ${CSS_ClickAnniversayLogo}
    @{elements}     Get WebElements     ${CSS_GetAnniversayName}
    FOR    ${element}    IN     @{elements}
        Append To List    ${ExpectedList}       ${element.text}
    END

Verify Both Anniversary Records Are Same
   lists should be equal  ${ActualList}    ${ExpectedList}  

















