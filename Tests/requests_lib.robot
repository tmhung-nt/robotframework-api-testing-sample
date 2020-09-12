*** Settings ***
Library         RequestsLibrary             WITH NAME   req
Library         Collections
Library         json

Suite Setup     Create Session          typicode    https://jsonplaceholder.typicode.com
Suite Teardown  Delete all sessions

*** Keywords ***
Reponse Status Code Should Be
    [Arguments]  ${response}   ${expected_code}
    Should Be Equal As Integers               ${response.status_code}   ${expected_code}

Reponse Json Field Value Should Be
    [Arguments]  ${response}  ${json_field_name}  ${expected_value}
    ${extract_value}=        Get From Dictionary       ${response.json()}        ${json_field_name}
    Should Be Equal As Strings                ${extract_value}               ${expected_value}

Reponse Json Object's Field Value Should Be
    [Arguments]  ${response}  ${json_object_name}  ${object_field_name}  ${expected_value}
    ${object_value}=        Get From Dictionary       ${response.json()}        ${json_object_name}
    ${object_field_value}=  Get From Dictionary       ${object_value}        ${object_field_name}
    Should Be Equal As Strings                ${object_field_value}               ${expected_value}


*** Test Cases ***
requests: Should have a name and belong to a company with a slogan
  ${resp}=        req.Get Request               typicode        /users/1
  Reponse Status Code Should Be                 ${resp}         200
  Reponse Json Field Value Should Be            ${resp}         name       Leanne Graham
  Reponse Json Object's Field Value Should Be   ${resp}         company    catchPhrase      Multi-layered client-server neural-net
  ${json}=        Dumps                         ${resp.json()}  indent=${4}
  Log to Console  ${json}


