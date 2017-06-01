*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Test Cases ***
Valid Login
    close browser
    Open Browser To Login Page
    Input Username    15787600
    Input Password    987123
    Submit Credentials
    Username should be visible
    [Teardown]    Close Browser
