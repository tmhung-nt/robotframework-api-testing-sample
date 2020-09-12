
*** Test Cases ***
Create servers and check if active
    ${ret}=    getServerInfo
    Set Headers   {"Accept":"application/json","Content-Type":"application/json","X-Auth-Token":"${token}"}
    POST         ${ret.service}/servers      {"server":{"imageRef":"${ret.image}","networks":[{"uuid":"${ret.network}"}],"name":"${ret.name}","flavorRef":"${ret.flavor}"}}
    Integer    response status   202
    ${serverid2}=   Output  $..id
    Set Global Variable    ${server2_id}  ${serverid2}