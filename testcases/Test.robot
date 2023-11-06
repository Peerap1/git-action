#คำสั่ง run
#robot -d results test.robot

*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}              https://www.google.com/


*** Keywords ***
Open web app
    Open Browser                ${URL}           gc
    Maximize Browser Window
    Set Selenium Speed          0.5

*** test cases ***
Test Log
    Log     Ole Pee

TEST OPEN APP
    Open web app
    SeleniumLibrary.Wait Until Page Contains Element 	 //*[@name="btnK"]
    Close browser