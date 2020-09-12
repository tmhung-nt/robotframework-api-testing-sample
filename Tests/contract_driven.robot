*** Settings ***
Library         REST   https://jsonplaceholder.typicode.com
...             spec=${EXECDIR}/json_repository/contract.json

*** Test Cases ***
Valid user
    REST.GET         /users/1

New user
    REST.POST        /users        ${EXECDIR}/json_repository/user.json

Edit user
    REST.PUT         /users/1      ${EXECDIR}/json_repository/user.json

Edit email
    REST.PATCH       /users/2      { "email": "ismo.aro@robotframework.dev" }

Delete
    REST.DELETE      /users/10
    REST.Output      $

Valid users
    REST.GET         /users