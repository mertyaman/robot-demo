*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         www.bilyoner.com
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     15787600
${VALID PASSWORD}    987123
${LOGIN URL}      https://${SERVER}/
${WELCOME URL}    https://${SERVER}/
${ERROR URL}      https://${SERVER}/

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Bilyoner.com - İddaa | Spor Toto | Milli Piyango | At Yarışı

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    wait until element is visible  css=.qa-input-userid      5
    Input Text    css=.qa-input-userid    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    css=.qa-input-password    ${password}

Submit Credentials
    Click Button    css=.btn.qa-button-login

Username should be visible
    wait until element is visible  css=.user-panel__name.qa-username      10
    element should be visible  css=.user-panel__name.qa-username

Error message should be visible
    wait until element is visible  css=.user-panel__error      10
    element should be visible  css=.user-panel__error
