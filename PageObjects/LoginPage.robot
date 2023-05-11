*** Settings ***
Documentation           Page Objects for Login Keywords
...                     Author: Rae Azcueta
Library                 SeleniumLibrary
Library                 OperatingSystem
Variables               ../ConfigEnvironment.py

*** Variables ***
${user_email}       id:username
${user_pass}        id:password
${submit_login}     id:btnSubmit
${user_menu}        id:menuUser
${sign_out}         id:menuUserLogout

*** Keywords ***
Start Test Case
    [Arguments]     ${server}=https://ryze-staging.formedix.com/sign-in    ${browser}=chrome
    Open Browser    ${server}   ${browser}
    Maximize Browser Window

Load User Credentials and Log In
    [Arguments]    ${user}=user0
    ${username}    Get User Credentials    ${user}     userName
    ${password}    Get User Credentials    ${user}     userPassword
    Input Text      ${user_email}     ${userName}
    Input Text      ${user_pass}     ${password}
    Click Button    ${submit_login}

Get User Credentials
    [Arguments]     ${user}     ${credentials}
    ${file}         Get File    userProfiles.json
    ${result}       Evaluate    json.loads('''${file}''')    json
    [Return]        ${result["${user}"]["${credentials}"]}

Logout
    Mouse Over                      ${user_menu}
    Click Element                   ${sign_out}
    Wait Until Element Is Visible   ${user_email}

End Test Case
    Close Browser
