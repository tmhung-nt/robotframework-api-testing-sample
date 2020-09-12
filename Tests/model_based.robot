*** Settings ***
Library         REST   https://jsonplaceholder.typicode.com
Suite Setup     Expect response body      ${EXECDIR}/json_repository/model.json

*** Test Cases ***
Valid user
    REST.GET         /users/1
    REST.String      $.email       format=email

New user
    REST.POST        /users        ${EXECDIR}/json_repository/user.json

Edit user
    REST.PUT         /users/1      ${EXECDIR}/json_repository/user.json

Edit email
    REST.PATCH       /users/2      { "email": "ismo.aro@robotframework.dev" }

Delete
    REST.Expect response body      { "required": [] }
    REST.DELETE      /users/10

Valid users
    REST.Clear expectations
    REST.GET         /users
    REST.Array       $             minItems=1    maxItems=10
    REST.Integer     $[*].id       maximum=10
