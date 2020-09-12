*** Settings ***
Library  REST
Library  DateTime
Resource     ../resources/test_keywords.robot
Resource      ../resources/identity_keywords.robot

Library  Collections


*** Test Cases ***
TEST001 Create server as admin user
   #Pass Execution    Deprecated test
   Admin Token issued
   Create servers and check if active

TEST002 Create a server with server admin user
   #Pass Execution    Deprecated test
   Server Admin Token
   Check if server admin can list servers