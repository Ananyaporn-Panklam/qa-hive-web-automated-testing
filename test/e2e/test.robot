*** Settings ***
Library   Browser   
Library    BuiltIn
Resource    ${CURDIR}/resources/xpath-variables.resource
Resource    ${CURDIR}/resources/ecommerce.resource

*** Variables ***
${URL}         https://web-demo.qahive.com/register
${EMAIL}       june@gmail.com
${PASSWORD}    junetester
${CARDHOLDER_NAME}    June 
${CARD_NO}            4242424242424242
${EXPIRATION}         3108202
${CVV}                123
${PAYMENT_SUCCESSFUL}     Payment Successful
${BACK TO SHOPPING}       BACK TO SHOPPING
${LOGIN_SUCCESS}    Login Successful! Redirecting...
${TRAVEL_BAG}    Travel Bag
*** Test Cases ***
Buy 1 item and paid successfully
    Go To Ecommerce Web App    ${URL}
    Log In By Valid Email and Password     ${EMAIL}    ${PASSWORD}
    Verify Aleart    ${LOGIN_SUCCESS}
    Add Travel Bag Product
    Verify trolley    (1)
    Click trolley
    Verify Product    ${TRAVEL_BAG} 
    Verify Amount    1
    Verify Price    3000
    Card Detail    ${CARDHOLDER_NAME}    ${CARD_NO}     ${EXPIRATION}    ${CVV}
    Verify Payment successfully    ${PAYMENT_SUCCESSFUL}
    Verify Back to Shopping    ${BACK TO SHOPPING}


*** Keywords ***
