*** Settings ***
Documentation       File Upload tests — verifies uploading a file via the browser's file input.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/file_upload_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           forms    file-upload    smoke


*** Test Cases ***
Upload Page Has File Input
    [Documentation]    Verifies the file upload page renders the file input element.
    Open File Upload Page
    Wait For Elements State    ${FILE_INPUT}    visible

Upload A Text File
    [Documentation]    Uploads a temporary text file and verifies its name is shown after upload.
    Open File Upload Page
    ${temp_file}=    Evaluate    __import__('tempfile').mkstemp(suffix='.txt', prefix='rf_upload_')[1]
    Evaluate    open('${temp_file}', 'w').write('Robot Framework upload test')
    Upload File    ${temp_file}
    Verify Uploaded Filename    rf_upload_
    Evaluate    __import__('os').remove('${temp_file}')
