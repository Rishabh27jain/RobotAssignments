*** Settings ***
Documentation   To validate the Intranet Functionality
Library     SeleniumLibrary
Library     String
Test Setup      Open The Browser And Login To Intranet
Test Teardown   Close Browser
Library     Collections
Resource        ../Common_Files/Resource.robot



*** Test Cases ***

Go To Home, Click Anniversary And Retrive Records
    mouse over          css:.dropdown-toggle
    click element       xpath://ul[@role='menu']/li[4]
    select from list by value        css:.search_anni      ${DateToSearch}
    @{elements}     Get WebElements     css:table.table-hover>tbody>tr>td:first-child
    	FOR    ${element}    IN     ${elements}
        	Append To List    ${ActualList}      ${element.text}
    	END


Click On Wishing You Section And Retrive Records
    click element       xpath://img[@title='View all anniversaries']
    @{expectedlist}   create list
    @{elements}     Get WebElements     css:table.table-hover>tbody>tr>td:first-child
    FOR    ${element}    IN     ${elements.text}
        Append To List    ${ExpectedList}       ${element.text}
    END



Verify Both List Are Same
   lists should be equal  ${ActualList}    ${ExpectedList}  

























