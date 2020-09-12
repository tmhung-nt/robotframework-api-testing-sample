*** Settings ***
Library         REST              https://jsonplaceholder.typicode.com

*** Keywords ***
Reponse Status Code Should Be
    [Arguments]  ${expected_code}
    REST.Integer     response status   ${expected_code}

Reponse Field Value Should Be
    [Arguments]  ${json_path}   ${expected_value}
    REST.String      ${json_path}            ${expected_value}

*** Test Cases ***
RESTinstance: Should have a name and belong to a company with a slogan
    REST.GET    /users/1
    Reponse Status Code Should Be       200
    Reponse Field Value Should Be       $.name              Leanne Graham
    Reponse Field Value Should Be       $..catchPhrase      Multi-layered client-server neural-net
#    REST.Integer     response status   200
#    REST.String      $.name            Leanne Graham
#    REST.String      $..catchPhrase    Multi-layered client-server neural-net
    REST.Output      $
