*** Settings ***
Documentation   To validate the Intranet Functionality
Test Setup      Open Browser And Login To Intranet
Test Teardown   Sign Out And Close Browser
Resource        ../Common/Resources.robot

*** Test Cases ***
Retrieve Birthday Records For Today's Date
    @{ActualBirthDayList}=	    Create List
    Set Global Variable         ${ActualBirthDayList}
    Mouse Over                  ${CSS_Cursor}
    Click Element       	${CSS_SelectBirthDay}
    ${Date}=   Convert To String   ${TodayDate}
    Set Global Variable         ${Date}
    Select From List By Value    ${CSS_SelectBirthDayDate}                  ${Date}
    ${elements}=  Get Element Count    ${CSS_GetBirthDayListCount}
    FOR    ${i}    IN RANGE    ${elements}
        ${n}=   Evaluate   ${i} +2
        Exit For Loop If      '${n}' > '${elements}'
        ${String}=    Convert To String    ${n}
        ${Element}    Replace String  ${CSS_GetBirthDayName}    INDEX   ${String}
        ${Name}       Get Text        ${Element}
        Append To List    ${ActualBirthDayList}      ${Name}
        ${i}=  Evaluate   ${i} + 1
    END

Retrieve Birthday Records From View All Birthday
    @{ExpectedBirthDayList}=    Create List
    Set Global Variable     ${ExpectedBirthDayList}
    Click Element      ${CSS_ViewAllBirthDay}
    ${ExpectedDate}        Get Selected List Values         ${CSS_GetDateDropDown}
    ${MatchedDate}=   Convert To string   ${ExpectedDate}
    IF    ${Date} == ${MatchedDate}
        ${elements}=  Get Element Count    ${CSS_GetBirthDayListCount}
        FOR    ${i}    IN RANGE    ${elements}
            ${n}=   Evaluate   ${i} +2
            Exit For Loop If      '${n}' > '${elements}'
            ${String}=    Convert To String    ${n}
            ${Element}    Replace String  ${CSS_GetBirthDayName}    INDEX   ${String}
            ${Name}       Get Text        ${Element}
            Append To List    ${ExpectedBirthDayList}      ${Name}
            ${i}=  Evaluate   ${i} + 1
        END
    END
      
Verify Both BirthDay Records Are Same
   lists should be equal  ${ActualBirthDayList}    ${ExpectedBirthDayList}

Retrieve Anniversary Records For Today's Date
    @{ActualList}=	    Create List
    Set Global Variable         ${ActualList}
    Mouse Over          ${CSS_Cursor}
    Click Element       ${CSS_SelectAnniversary}
    Select From List By Balue        ${CSS_SearchDate}     ${Date}
    @{elements}     Get WebElements    ${CSS_GetAnniversaryName}
    FOR    ${element}    IN     @{elements}
        Append To List    ${ActualList}      ${element.text}
    END

Click On Wishing You Section And Retrieve Records
    ${date1}     Set Variable          ${Date}
    @{ExpectedList}=	    Create List
    Set Global Variable         ${ExpectedList}
    Click element       ${CSS_ClickAnniversaryLogo}
    ${Date1}        Get Selected List Values       ${CSS_GetDateDropDown}
    ${String1}=   Convert To String   ${Date1}
    ${ExpectedDate1}=   Convert To string   ${date1}
    IF    ${String1} == ${ExpectedDate1}
        @{elements}     Get WebElements     ${CSS_GetAnniversaryName}
        FOR    ${element}    IN     @{elements}
            Append To List    ${ExpectedList}       ${element.text}
        END
    END

Verify Both Anniversary Records Are Same
   lists should be equal  ${ActualList}    ${ExpectedList}


