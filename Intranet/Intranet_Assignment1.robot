*** Settings ***
Documentation   To Validate The Intranet Functionality
Test Setup      Open The Browser And Login To Intranet
Test Teardown   Close Browser
Resource        ../Common/Resources.robot

*** Test Cases ***

Enter Name In Search Field
    @{ActualList}=	    create list
    Set Global Variable         ${ActualList}
    input text          ${CSS_SearchName}                      ${PartialText}
    Press Keys          ${CSS_SearchName}                      ENTER
    ${elements}=  get element count    ${CSS_GetListCount}
    FOR    ${i}    IN RANGE    ${elements}
       Exit For Loop If      '${i}' == '${elements}'
       ${n}=   Evaluate   ${i} +1
       ${name}       get text        css:table.table-hover>tbody>tr:nth-child(${n})>td:nth-child(2)
       Append To List    ${ActualList}      ${name}
       ${i}=  Evaluate   ${i} + 1
    END

Verify Name Contain Partial Text
    FOR  ${element}    IN  @{ActuaLList}
         ${contains}=    Run Keyword And Return Status    Should Contain    ${element}    ${PartialText}
         Run Keyword If    ${contains} == "False"    Fail    PartialTextNotMatched
    END
























