*** Settings ***
Documentation   To validate the Intranet Functionality
Library     SeleniumLibrary
Library     String
Test Setup      Open The Browser And Login To Intranet
Test Teardown   Close Browser
Library     Collections
Resource        ../Common_Files/Resource.robot



*** Test Cases ***
Enter Name In Search Field

    input text          id:birds                       ${InputText}
    Press Keys          id:birds                       ENTER
    ${elements}=  get element count    css:table.table-hover>tbody>tr:nth-child(n)
    FOR    ${i}    IN RANGE    ${elements}
       Exit For Loop If      '${i}' == '${elements}'
       ${n}=   Evaluate   ${i} +1
       ${name}       get text        css:table.table-hover>tbody>tr:nth-child(${n})>td:nth-child(2)
       Append To List    ${ActualList1}      ${name}
       ${i}=  Evaluate   ${i} + 1
    END

Verify The Result Table,Name Must Contain Searched Text
    FOR  ${element}     IN  @{actuallist1}
         ${contains}=    Run Keyword And Return Status    Should Contain    ${element}    ${InputText}
	 IF      '${contains}' == "TRUE"
            LOG     Given name contains the searched text
        ELSE
            LOG     Given name does not contrain the search text
        END		
    END



























