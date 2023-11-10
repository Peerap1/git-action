#คำสั่ง run
#robot -d results test.robot

*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${URL}              https://www.google.com/


*** Keywords ***
Open web app
    # Open Browser                ${URL}           gc        options=--no-sandbox
    # Maximize Browser Window
    # Set Selenium Speed          0.5
    [Arguments]    ${url}=${URL}
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --window-size\=400,980

    ${os}=  Evaluate    platform.system()    platform

    Run Keyword If    'linux'=='linux'    Run Keywords    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    ...    AND    Call Method    ${options}    add_argument    --disable-gpu
    ...    AND    Call Method    ${options}    add_argument    --no-sandbox
    ...    AND    Call Method    ${options}    add_argument    --disable-popup-blocking
    # ...    AND    Call Method    ${options}    add_argument    --headless
    SeleniumLibrary.Create WebDriver    Chrome    chrome_options=${options}
    SeleniumLibrary.Go To    ${url}

*** test cases ***
Test Log
    Log     Ole Pee

TEST OPEN APP
    Open web app
    SeleniumLibrary.Wait Until Page Contains Element 	 //*[@name="btnK"]
    Close browser
