*** Settings ***
Library  RequestsLibrary
Library  Collections
Library  JSONLibrary
Library  os
Library  String

*** Variables ***
${base_url}=    https://rahulshettyacademy.com

*** Test Cases ***
post_add_place
    create session  post_place  ${base_url}
    ${body}=    Converting a JSON File
    ${header}=  create dictionary   Content-Type=application/json
    ${response}=    post request  post_place    /maps/api/place/add/json?key =qaclick123    data=${body}       headers=${header}
    log to console  ${response.content}
    log to console  ${response.status_code}

*** Keywords ***
Converting a JSON File
    ${myjsondata}=      load json from file     C:/Users/Harsha/PycharmProjects/robot_api/TestCases/data.json
    ${myjsondata_str}=  convert to string  ${myjsondata}
    ${myjsondata_str_replace}=  replace string  ${myjsondata_str}   '   "
    ${MY_DATA_TABLE_VALUES}    evaluate  json.loads('''${myjsondata_str_replace}''')    json
    [Return]  ${MY_DATA_TABLE_VALUES}