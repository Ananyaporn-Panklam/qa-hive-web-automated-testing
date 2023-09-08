*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library         Collections
Resource    ${CURDIR}/data-test/user-data-test.resource
Resource    ${CURDIR}/resources/user.resource

*** Variables ***
${BASE_URL}    https://petstore.swagger.io/v2
${PAYLOAD_PATH}    ${CURDIR}/payload
${USER_PAYLOAD}    ${PAYLOAD_PATH}/user.json
${JSON_CONTENT_TYPE}    application/json
${EXPECTED_CODE}    200
${EXPECTED_TYPE}    unknown

*** Test Cases ***
POST Created User and Validate Success  
    POST Create New User
    Validate Response Code, Type and Message

Get Created User and Validate Success 
    Get Created User
    Validate Content Response

*** Keywords ***
    
Create User Body
    ${request_body}    Create Dictionary
    ...    id=${ID}
    ...    username=${USERNAME}
    ...    firstName=${FIRSTNAME}
    ...    lastName=${LASTNAME}
    ...    email=${EMAIL}
    ...    password=${PASSWORD}
    ...    phone=${PHONE}
    ...    userStatus=${USER_STATUS}
    Set Test Variable    ${request_body} 

POST Create New User
    ${headers}    Create Dictionary    Content-Type=${JSON_CONTENT_TYPE}
    Create User Body
    ${response}    POST   ${BASE_URL}/user    headers=${headers}        json=${request_body}
    ${response_json}    Set Variable    ${response.json()}
    Set Test Variable    ${response_json}

Validate Response Code, Type and Message
    Validate Response Code    ${response_json}    ${EXPECTED_CODE}
    Validate Response Type    ${response_json}    ${EXPECTED_TYPE}
    Validate Response Message    ${response_json}    ${ID}

Get Created User
    ${headers}    Create Dictionary    Content-Type=${JSON_CONTENT_TYPE}
    ${response}     Get    ${BASE_URL}/user/${USERNAME}    headers=${headers}
    ${response_json}    Set Variable    ${response.json()}
    Set Test Variable    ${response_json}

Validate Content Response
    Validate Response Id             ${response_json}    ${ID}

    Validate Response Username       ${response_json}    ${USERNAME}

    Validate Response First Name     ${response_json}    ${FIRSTNAME}

    Validate Response Last Name      ${response_json}    ${LASTNAME}

    Validate Response Email          ${response_json}    ${EMAIL}

    Validate Response Password       ${response_json}    ${PASSWORD}

    Validate Response Phone          ${response_json}    ${PHONE}

    Validate Response User Status    ${response_json}    ${USER_STATUS}




