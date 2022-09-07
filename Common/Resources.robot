*** Settings ***
Documentation     A resource file with reusable keywords and variables.
Library           SeleniumLibrary
Library     	  String
Library     	  Collections
Library		      BuiltIn
Resource          locator_variables.robot 
Resource          keywords.robot