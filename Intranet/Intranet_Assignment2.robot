*** Settings ***
Documentation   To Validate The Intranet Functionality
Suite Setup   Open Browser And Login To Intranet
Suite Teardown   Sign Out And Close Browser
Resource        ../Common/Resources.robot

*** Test Cases ***
Search Holiday For First Year And Location
    @{Holiday2022}=	Create List
    Set Global Variable            ${Holiday2022}
    Mouse Over                 	   ${CSS_Cursor}
    Click Element                  ${CSS_SelectHoliday}
    Select From List By Value      ${CSS_SelectHolidayYear}     ${EnterFirstHolidayYear}
    Select From List By Value       ${CSS_SelectLocation}        ${EnterLocationFirstYear}
    Click Button                   ${CSS_SubmitButton}
    ${No_of_rows1}=       Get Element Count      ${CSS_PageCount}
    Set Global Variable   ${No_of_rows1}
    FOR     ${i}    IN RANGE    ${No_of_rows1}
       @{elements2022}      Create List
       Exit For Loop If      '${i}'=='${No_Of_rows1}'
       ${n}=   Evaluate   ${i} +1
       LOG      ${elements2022}
       Click Element        ${CSS_ClickPageCount}	
       @{elements2022}     Get WebElements      ${CSS_GetHolidayList}
       ${i}=  Evaluate   ${i} + 1
       FOR    ${element}    IN     @{elements2022}
            Append To List    ${Holiday2022}        ${element.text}
       END
    END
    IF   ${No_Of_rows1} == 0
       @{elements2022}      Create List
       @{elements2022}     Get WebElements      ${CSS_GetHolidayList}
       FOR    ${element}    IN     @{elements2022}
            Append To List    ${Holiday2022}        ${element.text}
       END
    END
    LOG     ${Holiday2022}
    ${cleared_list}=    Evaluate    [x for x in @{Holiday2022} if x]
    Log    ${cleared_list}
    Set Global Variable   ${cleared_list}

Search Holiday For Different Year And Location
    Go To             ${Home_Page}
    @{Holiday2021}=	create list
    Set Global Variable            ${Holiday2021}
    Mouse Over          	   ${CSS_Cursor}
    Click Element                  ${CSS_SelectHoliday}
    Select From List By Value    ${CSS_SelectHolidayYear}      ${EnterSecondHoliddayYear}
    Select From List By Value      ${CSS_SelectLocation}         ${EnterLocationSecondYear}
    Click Button                   ${CSS_SubmitButton}
    ${No_of_rows2}=       Get Element Count      ${CSS_PageCount}
    FOR     ${i}    IN RANGE    ${No_of_rows2}
       @{elements2021}      Create List
       Exit For Loop If      '${i}'=='${No_Of_rows1}'
       ${n}=   Evaluate   ${i} +1
       Click Element        ${CSS_PageCount}
       @{elements2022}     Get WebElements      ${CSS_GetHolidayList}
       ${i}=  Evaluate   ${i} + 1
       FOR    ${element}    IN     @{elements2022}
            Append To List    ${Holiday2021}        ${element.text}
       END
    END
    IF   ${No_Of_rows2} == 0
       @{elements2021}      Create List
       @{elements2021}     Get WebElements      ${CSS_GetHolidayList}
       FOR    ${element}    IN     @{elements2022}
            Append To List    ${Holiday2021}        ${element.text}
       END
    END
    ${cleared_list1}=    Evaluate    [x for x in @{Holiday2021} if x]
    Set Global Variable     ${cleared_list1}

Verify The Differnece Between Given Year And Location
    Go To             ${Home_Page}
    @{DifferenceList}=        Create List
    Set Global Variable   @{DifferenceList}
    @{DifferenceList1}=        Create List
    ${Element_Number}       Set Variable    ${0}
    Mouse Over          	   ${CSS_Cursor}
    Click Element                  ${CSS_SelectHoliday}
    Select From List By Value      ${CSS_SelectHolidayYear}      ${EnterFirstHolidayYear}
    Select From List By Value      ${CSS_SelectLocation}         ${EnterLocationSecondYear}
    Click Button                   ${CSS_SubmitButton}
    FOR     ${i}    IN RANGE    ${No_of_rows1}
        ${Element_Number}       Set Variable    ${0}
        Exit For Loop If      '${i}'=='${No_Of_rows1}'
        ${n}=   Evaluate   ${i} +1
        Click Element       ${CSS_ClickPageCount}
        ${i}=  Evaluate   ${i} + 1
        FOR    ${element2022}    IN    @{cleared_list}
            ${Element_Number}=  Evaluate   ${Element_Number} + 1
            ${contains}=    Run Keyword And Return Status    Should Contain    ${cleared_list1}   ${element2022}
            IF      '${contains}' == "False"
		${String}=    Convert To String    ${Elemeant_Number}
                ${Element}    Replace String  ${CSS_GetAllCellData}   INDEX   ${String}
                ${elements202}     Get WebElement      ${Element}
                Append To list  ${DifferenceList}    ${elements202.text}
                END
        END
    END
    ${cleared_list2}=    Evaluate    [x for x in @{DifferenceList} if x]
    Set Global Variable     ${cleared_list2}
    &{Dictionary}   CREATE DICTIONARY   ${EnterFirstHolidayYear}=${cleared_list2}
    LOG     ${Dictionary}

