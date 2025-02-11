*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://automationexercise.com
${BROWSER}    Chrome
${EMAIL}    incorrectemail@example.com
${PASSWORD}    incorrectpassword123
${SCREENSHOT_DIR}    ${OUTPUT_DIR}/screenshots

*** Test Cases ***
Login User with Incorrect Email and Password
    [Documentation]    Verify that login with incorrect credentials fails
    [Setup]    Set Screenshot Directory    ${SCREENSHOT_DIR}
    [Teardown]    Run Keyword If Test Failed    Capture Page Screenshot    ${SCREENSHOT_DIR}/login_failure.png

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Automation Exercise

    Click Element    xpath=//a[contains(text(), 'Signup')]
    Wait Until Element Is Visible    xpath=//h2[contains(text(), 'Login to your account')]    timeout=10s
    Element Should Be Visible    xpath=//h2[contains(text(), 'Login to your account')]

    Input Text    name=email    ${EMAIL}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//button[text()='Login']
    
    Wait Until Element Is Visible    xpath=//p[contains(text(), 'Your email or password is incorrect!')]    timeout=10s
    Element Should Be Visible    xpath=//p[contains(text(), 'Your email or password is incorrect!')]
    
    Capture Page Screenshot    ${SCREENSHOT_DIR}/login_failure.png
    Close Browser
