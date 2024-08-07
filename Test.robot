*** Settings ***
Library     SeleniumLibrary
Library     XML

*** Variables ***
${URL}          https://www.instagram.com/
${USERNAME}     jeanpaula
${PASSWORD}     test121212
${USERNAME FIELD}   //*[@id="loginForm"]/div/div[1]/div/label/input
${PASSWORD FIELD}   //*[@id="loginForm"]/div/div[2]/div/label/input

*** Test Cases ***
InstaLoginWrong
    Open Browser                    ${URL}  chrome
    Maximize Browser Window
    Input Text                      ${USERNAME FIELD}   ${USERNAME}
    Input Text                      ${PASSWORD FIELD}   ${PASSWORD}
    Sleep    5

    Click Button                    //*[@id="loginForm"]/div/div[3]/button
    Wait Until Element Is Visible   //*[@id="loginForm"]/span/div
    Element Should Contain          //*[@id="loginForm"]/span/div    Sorry, your password was incorrect. Please double-check your password.
    Sleep                           5
    Close Browser

InstaLoginCorrect
    Open Browser                    ${URL}  chrome
    Reload Page
    Input Text                      //*[@id="loginForm"]/div/div[1]/div/label/input    jeanpaulatallah
    Input Text                      //*[@id="loginForm"]/div/div[2]/div/label/input    etetetetete
    Click Button                    //*[@id="loginForm"]/div/div[3]/button
    Sleep                           10
    Wait Until Element Is Visible   id:mount_0_0_b5
    Element Should Contain          verificationCodeDescription    Enter a 6-digit login code generated by an authentication app.
    Close Browser

*** Keywords ***
