*** Settings ***
Library   Browser   
Library    BuiltIn
Resource    ${CURDIR}/resources/xpath-variables.resource
Resource    ${CURDIR}/resources/ecommerce.resource

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

Log In By Valid Email and Password 
    Wait For Elements State    ${email_xpath}
    Fill Text    ${email_xpath}    ${EMAIL}
    Wait For Elements State    ${password_xpath}
    Fill Text    ${password_xpath}    ${PASSWORD}
    Wait For Elements State    ${submit_xpath}
    Click    ${submit_xpath}
    Sleep    3

Verify Aleart
    Wait For Elements State    ${alert_success_xpath} 
    ${text}    Get Text    ${alert_success_xpath} 
    Should Be Equal    ${text}    Login Successful! Redirecting...

Add Travel Bag Product
    Wait For Elements State    ${travel_bag_xpath}
    Click    ${travel_bag_xpath}

Click trolley
    Wait For Elements State    ${trolley_xpath}
    Click    ${trolley_xpath}

Verify trolley
    Wait For Elements State    ${trolley_xpath}
    ${text}    Get Text    ${trolley_xpath}
    Should Be Equal    ${text}    (1)

Verify Product
    ${text} =    Get Text    ${verify_travel_bag_xpath}
    Should Be Equal    ${text}    Travel Bag

Verify Amount
    ${text} =    Get Text    ${verify_amount_xpath}
    Should Be Equal    ${text}    1

Verify Price
    ${text} =    Get Text    ${verify_price_xpath}
    Should Be Equal    ${text}    3000

Card Detail
    Wait For Elements State    ${cardholder_name_xpath}
    Fill Text    ${cardholder_name}    ${CARDHOLDER_NAME}

    Wait For Elements State    ${cardholder_name_xpath}
    Fill Text    ${cardholder_name_xpath}    ${CARD_NO}

    Wait For Elements State   ${expiration_xpath}
    Fill Text    ${expiration_xpath}   ${EXPIRATION}

    Wait For Elements State    ${cvv_xpath}
    Fill Text    ${cvv_xpath}    ${CVV}

    Wait For Elements State    ${payment_xpath}
    Click   ${payment_xpath}

Verify Payment successfully
    Wait For Elements State    ${payment_successful_xpath}
    ${text}    Get Text    ${payment_successful_xpath}
    Should Be Equal    ${text}    Payment Successful

Verify Back to Shopping
    Wait For Elements State    ${back_to_shipping_xpath}
    ${text}    Get Text    ${back_to_shipping_xpath}
    Should Be Equal    ${text}    BACK TO SHOPPING