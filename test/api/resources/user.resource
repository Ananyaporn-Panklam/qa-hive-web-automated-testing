*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library         Collections

*** Keywords ***

Validate Response Code 
    [Arguments]    ${response}    ${expected_code}
    ${code}    Get From Dictionary    ${response}    code
    Should Be Equal As Strings    ${code}    ${expected_code}
    
Validate Response Type
    [Arguments]    ${response}    ${expected_type}
    ${type}    Get From Dictionary    ${response}    type
    Should Be Equal As Strings    ${type}   ${expected_type}

Validate Response Message
    [Arguments]    ${response}    ${expected_id}
    ${message}    Get From Dictionary    ${response}    message
    Should Be Equal As Strings    ${message}    ${expected_id}

Validate Response Id 
    [Arguments]    ${response}    ${expected_id}
    ${id}    Get From Dictionary    ${response}    id
    Should Be Equal As Strings    ${id}    ${expected_id}

Validate Response Username 
    [Arguments]    ${response}    ${expected_username}
    ${username}    Get From Dictionary    ${response}     username
    Should Be Equal As Strings    ${username}    ${expected_username}

Validate Response First Name 
    [Arguments]    ${response}    ${expected_username}
    ${firstName}    Get From Dictionary    ${response}     firstName
    Should Be Equal As Strings    ${firstName}    ${expected_username}

Validate Response Last Name 
    [Arguments]    ${response}    ${expected_last_name}
    ${last_name}    Get From Dictionary    ${response}     firstName
    Should Be Equal As Strings    ${last_name}    ${expected_last_name}

Validate Response Email
    [Arguments]    ${response}    ${expected_email}
    ${email}    Get From Dictionary    ${response}     email
    Should Be Equal As Strings    ${email}    ${expected_email}

Validate Response Password 
    [Arguments]    ${response}    ${expected_password}
    ${password}    Get From Dictionary    ${response}     password
    Should Be Equal As Strings    ${password}    ${expected_password}

Validate Response Phone
    [Arguments]    ${response}    ${expected_phone}
    ${phone}    Get From Dictionary    ${response}     phone
    Should Be Equal As Strings    ${phone}    ${expected_phone}

Validate Response User Status 
    [Arguments]    ${response}    ${expected_user_status}
    ${user_status}    Get From Dictionary    ${response}     userStatus
    Should Be Equal As Strings    ${user_status}    ${expected_user_status}