*** Settings ***
Documentation   To Validate The Intranet Functionality
Test Setup      Open The Browser And Login To Intranet
Test Teardown   Close Browser
Resource        ../Common/Resources.robot

*** Test Cases ***

Go To Home And Click On Holiday 
    mouse over                     ${CSS_Cursor}
    click element                  ${CSS_SelectHoliday}

Search Holiday For Given Year And Location
    @{Holiday2022}=	create list
    Set Global Variable            ${Holiday2022}
    mouse over                 	   ${CSS_Cursor}
    click element                  ${CSS_SelectHoliday}
    select from list by value      ${CSS_SelectHolidayYear}     ${EnterFirstHolidayYear}
    select from list by value      ${CSS_SelectLocation}        ${EnterLocationFirstYear}
    click button                   ${CSS_SubmitButton}
    @{elements2022}     Get WebElements      ${CSS_GetHolidayList}
    FOR    ${element}    IN     @{elements2022}
       Append To List    ${Holiday2022}        ${element.text}
    END

Search Holiday For Different Year And Location
    @{Holiday2021}=	create list
    Set Global Variable            ${Holiday2021}
    mouse over          	   ${CSS_Cursor}
    click element                  ${CSS_SelectHoliday}
    select from list by value      ${CSS_SelectHolidayYear}      ${EnterSecondHoliddayYear}
    select from list by value      ${CSS_SelectLocation}         ${EnterLocationSecondYear}
    click button                   ${CSS_SubmitButton}
    @{elements2021}     Get WebElements        ${CSS_GetHolidayList}
    FOR    ${element}    IN     @{elements2021}
       Append To List    ${Holiday2021}       ${element.text}
    END

Verify The Differnece Between Given Year And Location
    
    @{DifferenceList}=        create list
    FOR    ${element2022}    IN    @{Holiday2022}
        ${contains}=    Run Keyword And Return Status    Should Contain    ${Holiday2021}    ${element2022}
        IF      '${contains}' == "False"
            append to list  ${DifferenceList}    ${element2022}
        END
    END
    LOG     ${DifferenceList}








