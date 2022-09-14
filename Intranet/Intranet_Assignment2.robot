*** Settings ***
Documentation   To Validate The Intranet Functionality
Suite Setup      Open Browser And Login To Intranet
Suite Teardown     Sign Out And Close Browser
Resource        ../Common/Resources.robot

*** Test Cases ***
Go To Home And Click On Holiday 
    Mouse Over                     ${CSS_Cursor}
    Click Element                  ${CSS_SelectHoliday}
    Wait Until Element Is Visible  ${CSS_HolidayListVisible}

Search Holiday For First Year And Location
    @{Holiday2022}=	Create List
    Set Global Variable            ${Holiday2022}
    Mouse Over                 	   ${CSS_Cursor}
    Click Element                  ${CSS_SelectHoliday}
    Select From List By Value      ${CSS_SelectHolidayYear}     ${EnterFirstHolidayYear}
    Select From List By Value       ${CSS_SelectLocation}        ${EnterLocationFirstYear}
    Click Button                   ${CSS_SubmitButton}
    @{elements2022}     Get WebElements      ${CSS_GetHolidayList}
    FOR    ${element}    IN     @{elements2022}
       Append To List    ${Holiday2022}        ${element.text}
    END

Search Holiday For Second Year And Location
    @{Holiday2021}=	Create List
    Set Global Variable            ${Holiday2021}
    Mouse Over         	   ${CSS_Cursor}
    Click Element                  ${CSS_SelectHoliday}
    Select From List By Value       ${CSS_SelectHolidayYear}      ${EnterSecondHolidayYear}
    Select From List By Value       ${CSS_SelectLocation}         ${EnterLocationSecondYear}
    Click Button                   ${CSS_SubmitButton}
    @{elements2021}     Get WebElements        ${CSS_GetHolidayList}
    FOR    ${element}    IN     @{elements2021}
       Append To List    ${Holiday2021}       ${element.text}
    END

Verify The Holiday Difference Between Both Years
    @{DifferenceList}=        Create List
    FOR    ${element2022}    IN    @{Holiday2022}
        ${contains}=    Run Keyword And Return Status    Should Contain    ${Holiday2021}    ${element2022}
        IF      '${contains}' == "False"
            Append To List  ${DifferenceList}    ${element2022}
        END
    END
    LOG     ${DifferenceList}
