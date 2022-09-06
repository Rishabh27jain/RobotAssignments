*** Settings ***
Documentation   To Validate The Intranet Functionality
Test Setup      Open The Browser And Login To Intranet
Test Teardown   Sign Out And Close Browser
Resource        ../Common/Resources.robot

*** Test Cases ***
Go To Home And Click On Holiday 
    Mouse Over                     ${CSS_Cursor}
    Click Element                  ${CSS_SelectHoliday}

Search Holiday For Given Year And Location
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

Search Holiday For Different Year And Location
    @{Holiday2021}=	Create List
    Set Global Variable            ${Holiday2021}
    Mouse Over         	   ${CSS_Cursor}
    Click Element                  ${CSS_SelectHoliday}
    Select From List By Value       ${CSS_SelectHolidayYear}      ${EnterSecondHoliddayYear}
    Select From List By Value       ${CSS_SelectLocation}         ${EnterLocationSecondYear}
    Click Button                   ${CSS_SubmitButton}
    @{elements2021}     Get WebElements        ${CSS_GetHolidayList}
    FOR    ${element}    IN     @{elements2021}
       Append To List    ${Holiday2021}       ${element.text}
    END

Verify The Differnece Between Given Year And Location
    
    @{DifferenceList}=        Create List
    FOR    ${element2022}    IN    @{Holiday2022}
        ${contains}=    Run Keyword And Return Status    Should Contain    ${Holiday2021}    ${element2022}
        IF      '${contains}' == "False"
            Append To List  ${DifferenceList}    ${element2022}
        END
    END
    LOG     ${DifferenceList}
