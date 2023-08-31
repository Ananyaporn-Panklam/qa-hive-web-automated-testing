*** Settings ***
Library   Browser   
Library    BuiltIn

*** Variables ***
${URL} =    https://web-demo.qahive.com/register
${EMAIL} =    june@gmail.com
${PASSWORD} =    junetester
${CARDHOLDER_NAME}    June 
${CARD_NO}    4242424242424242
${EXPIRATION}    3108202
${CVV}    123
*** Test Cases ***
Buy 1 item and paid successfully
    Go To Ecommerce Web App
    Log In By Valid Email and Password 
    Verify Aleart
    Add Travel Bag Product
    Verify trolley
    Click trolley
    Verify Product
    Verify Amount
    Verify Price
    Card Detail
    Verify Payment successfully
    Verify Back to Shopping
*** Keywords ***

Go To Ecommerce Web App
    New Browser    headless=false
    New Page    ${URL}    
    # Wait For Elements State    xpath=//a[normalize-space()='eCommerce Web App']
    # Click    xpath=//a[normalize-space()='eCommerce Web App']

Log In By Valid Email and Password 
    Wait For Elements State    xpath=//input[@data-testid='email']
    Fill Text    xpath=//input[@data-testid='email']    ${EMAIL}
    Wait For Elements State    xpath=//input[@data-testid='password']
    Fill Text    xpath=//input[@data-testid='password']    ${PASSWORD}
    Wait For Elements State    xpath=//button[@data-testid='submit']
    Click    xpath=//button[@data-testid='submit']
    Sleep    3

Verify Aleart
    Wait For Elements State    xpath=//div[@class='alert alert-success']
    ${text}    Get Text    xpath=//div[@class='alert alert-success']
    Should Be Equal    ${text}    Login Successful! Redirecting...

Add Travel Bag Product
    Wait For Elements State    xpath=//div[@class='card-title h5' and text()='Travel Bag']/following-sibling::button[@class='btn btn-primary' and text()='Add to cart']
    Click    xpath=//div[@class='card-title h5' and text()='Travel Bag']/following-sibling::button[@class='btn btn-primary' and text()='Add to cart']

Click trolley
    Wait For Elements State    xpath=//a[@href='/checkout']
    Click    xpath=//a[@href='/checkout']

Verify trolley
    Wait For Elements State    xpath=//a[@href='/checkout']
    ${text}    Get Text    xpath=//a[@href='/checkout']
    Should Be Equal    ${text}    (1)

Verify Product
    ${text} =    Get Text    xpath=//h5[contains(text(), 'Travel Bag')]
    Should Be Equal    ${text}    Travel Bag

Verify Amount
    ${text} =    Get Text    xpath=//h5[@class='fw-normal mb-0']
    Should Be Equal    ${text}    1

Verify Price
    ${text} =    Get Text    xpath=(//h5[@class='mb-0'])[1]
    Should Be Equal    ${text}    3000

Card Detail
    Wait For Elements State    xpath=//input[@name='cardholderName']
    Fill Text    xpath=//input[@name='cardholderName']    ${CARDHOLDER_NAME}

    Wait For Elements State    xpath=//input[@name='cardNumber']
    Fill Text    xpath=//input[@name='cardNumber']    ${CARD_NO}

    Wait For Elements State    xpath=//input[@name='expiration']
    Fill Text    xpath=//input[@name='expiration']    ${EXPIRATION}

    Wait For Elements State    xpath=//input[@name='cvv']
    Fill Text    xpath=//input[@name='cvv']    ${CVV}

    Wait For Elements State    xpath=//button[normalize-space()='Payment']
    Click   xpath=//button[normalize-space()='Payment']  

Verify Payment successfully
    Wait For Elements State    xpath=//h2[@class='mt-4']
    ${text}    Get Text    xpath=//h2[@class='mt-4']
    Should Be Equal    ${text}    Payment Successful

Verify Back to Shopping
    Wait For Elements State    xpath=//a[normalize-space()='Back to Shopping']  
    ${text}    Get Text    xpath=//a[normalize-space()='Back to Shopping']
    Should Be Equal    ${text}    BACK TO SHOPPING