*** Settings ***
Library   Browser   
Library    BuiltIn
Resource    ${CURDIR}/xpath-variables.resource

*** Keywords ***
Go To Ecommerce Web App
    [Arguments]    ${url}
    New Browser    headless=false
    New Page    ${url}   

Log In By Valid Email and Password 
    [Arguments]    ${email}    ${password}
    Wait For Elements State    ${email_xpath}
    Fill Text    ${email_xpath}   ${email}
    Wait For Elements State    ${password_xpath}
    Fill Text    ${password_xpath}    ${password}
    Wait For Elements State    ${submit_xpath}
    Click    ${submit_xpath}
    Sleep    3

Verify Aleart
    [Arguments]    ${expected}
    Wait For Elements State    ${alert_success_xpath} 
    ${text}    Get Text    ${alert_success_xpath} 
    Should Be Equal    ${text}    ${expected}

Add Travel Bag Product
    Wait For Elements State    ${travel_bag_xpath}
    Click    ${travel_bag_xpath}

Click trolley
    Wait For Elements State    ${trolley_xpath}
    Click    ${trolley_xpath}

Verify trolley
    [Arguments]    ${expected}
    Wait For Elements State    ${trolley_xpath}
    ${text}    Get Text    ${trolley_xpath}
    Should Be Equal    ${text}    ${expected}

Verify Product
    [Arguments]    ${expected}
    ${text} =    Get Text    ${verify_travel_bag_xpath}
    Should Be Equal    ${text}    ${expected}

Verify Amount
    [Arguments]    ${expected}
    ${text} =    Get Text    ${verify_amount_xpath}
    Should Be Equal    ${text}    ${expected}

Verify Price
    [Arguments]    ${expected}
    ${text} =    Get Text    ${verify_price_xpath}
    Should Be Equal    ${text}    ${expected}

Card Detail
    [Arguments]    ${cardholder_name}    ${card_no}    ${expiration}    ${cvv}
    Wait For Elements State    ${cardholder_name_xpath}
    Fill Text    ${cardholder_name_xpath}    ${cardholder_name}

    Wait For Elements State    ${cardholder_number_xpath}
    Fill Text    ${cardholder_number_xpath}    ${card_no}

    Wait For Elements State   ${expiration_xpath}
    Fill Text    ${expiration_xpath}   ${expiration}

    Wait For Elements State    ${cvv_xpath}
    Fill Text    ${cvv_xpath}    ${cvv}

    Wait For Elements State    ${payment_xpath}
    Click   ${payment_xpath}

Verify Payment successfully
    [Arguments]    ${expected}    
    Wait For Elements State    ${payment_successful_xpath}
    ${text}    Get Text    ${payment_successful_xpath}
    Should Be Equal    ${text}    ${expected}  

Verify Back to Shopping
    [Arguments]    ${expected}  
    Wait For Elements State    ${back_to_shipping_xpath}
    ${text}    Get Text    ${back_to_shipping_xpath}
    Should Be Equal    ${text}    ${expected}  