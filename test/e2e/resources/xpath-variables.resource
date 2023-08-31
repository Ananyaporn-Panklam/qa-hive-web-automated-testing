*** Variables ***
##Login
${email_xpath}       xpath=//input[@data-testid='email']
${password_xpath}    xpath=//input[@data-testid='password']
${submit_xpath}    xpath=//button[@data-testid='submit']
${alert_success_xpath}    xpath=//div[@class='alert alert-success']

#Product detail
${travel_bag_xpath}    xpath=//div[@class='card-title h5' and text()='Travel Bag']/following-sibling::button[@class='btn btn-primary' and text()='Add to cart']
${trolley_xpath}    xpath=//a[@href='/checkout']
${verify_travel_bag_xpath}    xpath=//h5[contains(text(), 'Travel Bag')]
${verify_amount_xpath}    xpath=//h5[@class='fw-normal mb-0']
${verify_price_xpath}    xpath=(//h5[@class='mb-0'])[1]

##Card Detail
${cardholder_name_xpath}    xpath=//input[@name='cardholderName']
${cardholder_number_xpath}    xpath=//input[@name='cardNumber']
${expiration_xpath}    xpath=//input[@name='expiration']
${cvv_xpath}    xpath=//input[@name='cvv']
${payment_xpath}    xpath=//button[normalize-space()='Payment']

${payment_successful_xpath}    xpath=//h2[@class='mt-4']
${back_to_shipping_xpath}    xpath=//a[normalize-space()='Back to Shopping']  