*** Settings ***
Documentation   To validate the Intranet Functionality
Test Setup      Open Browser And Login To Intranet
Test Teardown   Sign Out And Close Browser
Resource        ../Common/Resources.robot

*** Test Cases ***
Retrieve Birthday Records For Today's Date
    ${TodayDate}      Get Current Date    Result_Format=%d
    @{ActualBirthDayList}=	    Create List
    Set Global Variable         ${TodayDate}
    Set Global Variable         ${ActualBirthDayList}
    Mouse Over                  ${CSS_Cursor}
    Click Link                  ${CSS_SelectBirth}
    Wait Until Element Is Visible   css:h4[class='top_heading_text']
    Select From List By Value       ${CSS_SelectBirthdayDate}                 ${TodayDate}
    ${elements}=  Get Element Count    ${CSS_GetBirthDayListCount}
    FOR    ${i}    IN RANGE    ${elements}
        ${n}=   Evaluate   ${i} +2
        Exit For Loop If      ${n} > ${elements}
        ${String}=    Convert To String    ${n}
        ${Element}    Replace String  ${CSS_GetBirthDayName}    INDEX   ${String}
        ${Name}       Get Text        ${Element}
        Append To List    ${ActualBirthDayList}      ${Name}
        ${i}=  Evaluate   ${i} + 1
    END

Verify Filter Is Applied On Birthday Column Date By Today's Date
      Click Element      ${CSS_ViewAllBirthDay}
      ${Date}        Get Selected List Label         ${CSS_GetDateDropDown}
      IF    ${TodayDate} == ${Date}
        Log To Console  DateMatched
      ELSE
        FAIL  DateNotMatch
      END

Retrieve Birthday Records From View All Birthday
    @{ExpectedBirthDayList}=    Create List
    Set Global Variable     ${ExpectedBirthDayList}
    Click Element      ${CSS_ViewAllBirthDay}
    ${elements}=  Get Element Count    ${CSS_GetBirthDayListCount}
    FOR    ${i}    IN RANGE    ${elements}
        ${n}=   Evaluate   ${i} +2
        Exit For Loop If      ${n} > ${elements}
        ${String}=    Convert To String    ${n}
        ${Element}    Replace String  ${CSS_GetBirthDayName}    INDEX   ${String}
        ${Name}       Get Text        ${Element}
        Append To List    ${ExpectedBirthDayList}      ${Name}
        ${i}=  Evaluate   ${i} + 1
    END

Verify Both BirthDay Records Are Same
   Lists Should Be Equal  ${ActualBirthDayList}    ${ExpectedBirthDayList}    

Retrieve Anniversary Records For Today's Date
    @{ActualList}=	    Create List
    Set Global Variable         ${ActualList}
    Mouse Over          ${CSS_Cursor}
    Click Element       ${CSS_SelectAnniversary}
    Select From List By Value        ${CSS_SearchDate}      ${TodayDate}
    @{elements}     Get WebElements    ${CSS_GetAnniversaryName}
    FOR    ${element}    IN     @{elements}
        Append To List    ${ActualList}      ${element.text}
    END

Verify Filter Is Applied On Anniversary Column Date By Today's Date
      Click Element       ${CSS_ClickAnniversaryLogo}
      ${Date}        Get Selected List Label         ${CSS_GetDateDropDown}
      IF    ${TodayDate} == ${Date}
        Log To Console  DateMatched
      ELSE
        FAIL  DateNotMatch
      END

Click On Wishing You Section And Retrieve Records
    @{ExpectedList}=	    Create List
    Set Global Variable         ${ExpectedList}
    Click element       ${CSS_ClickAnniversaryLogo}
    @{elements}     Get WebElements     ${CSS_GetAnniversaryName}
    FOR    ${element}    IN     @{elements}
        Append To List    ${ExpectedList}       ${element.text}
    END
    LOG     ${ExpectedList}

Verify Both Anniversary Records Are Same
   Lists Should Be Equal  ${ActualList}    ${ExpectedList}