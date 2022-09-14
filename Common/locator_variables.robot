*** Variables ***
${CSS_Email}                 	css:input[stype='email']
${CSS_Password}		        css:input.ext-input
${CSS_SelectNext}	        css:input[id='idSIButton9']
${CSS_ElementVisible}	    	css:a[id='cantAccessAccount']
${HomePage}                    	https://intranet.einfochips.com/employee_intranet/portal/user/dashboard
${CSS_PswdElementVisible}   	css:a[id='idA_PWD_ForgotPassword']
${CSS_SearchName}	    	css:input[id='birds']
${CSS_GetListCount}	    	css:table.table-hover>tbody>tr:nth-child(n)
${CSS_GetVariableName}	    	css:table.table-hover>tbody>tr:nth-child(INDEX)>td:nth-child(2)
${CSS_Cursor}		    	css:.dropdown-toggle
${CSS_SelectHoliday}	    	css:li[class='dropdown-item']:nth-child(3)
${CSS_SelectHolidayYear}        css:select[name='holiday_year']
${CSS_SelectLocation}	    	css:select[id='branch_id']
${CSS_SelectBirthdayDate}       css:section[id='no-more-tables'] select
${CSS_SubmitButton}	        css:button.btn-success
${CSS_GetHolidayList}	        css:section[id='no-more-tables'] td[data-title='Description']:nth-child(4)
${CSS_SelectAnniversary}        css:li[class='dropdown-item']:nth-child(4)
${CSS_SearchDate}	        css:select.input-small
${CSS_GetAnniversaryName}       css:table.table-hover>tbody>tr>td:first-child
${CSS_ClickAnniversaryLogo}	css:img[title='View all anniversaries']
${CSS_LogoutLink}		css:div[class='user-portion'] a[href*='logout']
${CSS_HolidayListVisible}	css:h4.top_heading_text
${CSS_SelectBirth}              css:ul[class='dropdown-menu'] a[href*='birthday']
${CSS_SelectBirthDay}           css:li[class='dropdown-item']:nth-child(5)
${CSS_GetBirthDayName}          css:table.table-hover>tbody>tr:nth-child(INDEX)>td:first-child
${CSS_GetBirthDayListCount}   	css:section[id='no-more-tables'] tbody tr
${CSS_ViewAllBirthDay}          css:img[title='View all birthdays']
${CSS_GetDate}                  css:select.search_bday
${CSS_HolidayListVisible}	css:h4.top_heading_text
${CSS_GetDateDropDown}          css:section[id='no-more-tables'] select