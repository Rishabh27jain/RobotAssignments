*** Settings ***
Documentation   To validate the Intranet Functionality
Library     SeleniumLibrary
Library     String
Test Setup      Open The Browser And Login To Intranet
Test Teardown   Close Browser
Library     Collections
Resource        ../Common_Files/Resource.robot


*** Test Cases ***

Go To Home And Click On Holiday And Find Holiday In Year 2022

    mouse over          css:.dropdown-toggle
    click element       xpath://li[@class='dropdown-item'][3]
    select from list by value      xpath://select[@name='holiday_year']    2022
    select from list by value      xpath://select[@id='branch_id']         ${CityName} 
    click button                   xpath://button[@id='btn_submit_holiday']
    ${elements}     Get WebElements      xpath://section[@id='no-more-tables']//table//tbody//tr//td[4]
    FOR    ${element}    IN     ${elements}
       Append To List    ${Holiday2022}        ${element.text}
    END

Go To Home And Click On Holiday And Find the holiday in a year 2021
    mouse over          css:.dropdown-toggle
    click element       xpath://li[@class='dropdown-item'][3]
    select from list by value      xpath://select[@name='holiday_year']    2021
    select from list by value      xpath://select[@id='branch_id']         ${CityName} 
    click button                   xpath://button[@id='btn_submit_holiday']
    ${elements}     Get WebElements       xpath://section[@id='no-more-tables']//table//tbody//tr//td[4]
    FOR    ${element}    IN     ${elements}       
       Append To List    ${Holiday2021}       ${element.text}
    END


Find the holiday difference for 2021 & 2022 for Ahmedabad. 
   
    FOR    ${elmenent2022}    IN    @{Holiday2022} 
       FOR      ${element2021}    IN   ${Holiday2021}
          IF    ${element2021} == ${element2022}
             ${var} = set variable 1
             exit for loop if   '${element2022}' == '${element2021}'
          ELSE
             ${var} = set variable 0
           END
       END
       IF   ${var} == 0
           append to list  ${DifferenceList}    ${element_2021}
       END
    END














