*** Settings ***
Library  REST
Library  DateTime
Library    ../helper_scripts/master.py
Library    Collections


*** Keywords ***

Admin Token issued
    ${ret}=    getProjectName    identity    admin
    &{resp}=      POST   ${ret.service}/auth/tokens     {"auth":{"identity":{"methods":["password"],"password":{"user":{"name":"${ret.username}","domain":{"name":"default"},"password":"${ret.password}"}}},"scope":{"project":{"name":"${ret.roles}","domain":{"name":"default"}}}}}
    Integer    response status   201
    ${token}=    Get From Dictionary    ${resp.headers}     X-Subject-Token
    Set Global Variable    ${token}     ${token}
    Output    ${token}


Server Admin Token
    ${ret}=    getProjectName    identity    server_admin
    &{resp}=      POST   ${ret.service}/auth/tokens     {"auth":{"identity":{"methods":["password"],"password":{"user":{"name":"${ret.username}","domain":{"name":"default"},"password":"${ret.password}"}}},"scope":{"project":{"name":"${ret.roles}","domain":{"name":"default"}}}}}
    Integer    response status   201
    ${token}=    Get From Dictionary    ${resp.headers}     X-Subject-Token
    Set Global Variable    ${token}     ${token}
    Output    ${token}