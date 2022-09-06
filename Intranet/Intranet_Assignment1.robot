*** Settings ***
Documentation   To Validate The Intranet Functionality
Test Setup      Open Browser And Login To Intranet
Test Teardown   Sign Out And Close Browser
Resource        ../Common/Resources.robot

*** Test Cases ***
Enter Name In Search Field
    @{ActualList}=	    Create List
    Set Global Variable         ${ActualList}
    Input Text          ${CSS_SearchName}                      ${PartialText}
    Press Keys          ${CSS_SearchName}                      ENTER
    ${elements}=  Get Element Count    ${CSS_GetListCount}
    FOR    ${i}    IN RANGE    ${elements}
       Exit For Loop If      '${i}' == '${elements}'
       ${n}=   Evaluate   ${i} +1
       ${String}=    Convert To String    ${n}
       ${Element}    Replace String  ${CSS_GetVariableName}   INDEX   ${String}
       ${Name}       get text        ${Element}
       Append To List    ${ActualList}      ${Name}
       ${i}=  Evaluate   ${i} + 1
    END

Verify Name Contain Partial Text
    FOR  ${element}    IN  @{ActuaLList}
         ${contains}=    Run Keyword And Return Status    Should Contain    ${element}    ${PartialText}
         Run Keyword If    ${contains} == "False"    Fail    PartialTextNotMatched
    END
