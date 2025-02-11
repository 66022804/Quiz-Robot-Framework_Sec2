*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://automationexercise.com
${BROWSER}    Chrome
${EMAIL}    incorrectemail@example.com
${PASSWORD}    incorrectpassword123

*** Test Cases ***
Login User with Incorrect Email and Password
    [Documentation]  
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Automation Exercise

    Click Element    link=Signup / Login
    Wait Until Element Is Visible    xpath=//h2[text()='Login to your account']    timeout=10s
    Element Should Be Visible    xpath=//h2[text()='Login to your account']

    Input Text    name=email    ${EMAIL}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[text()='Login']
    
   
    Wait Until Element Is Visible    xpath=//p[text()='Your email or password is incorrect!']    timeout=10s
    Element Should Be Visible    xpath=//p[text()='Your email or password is incorrect!']
    
    Close Browser
