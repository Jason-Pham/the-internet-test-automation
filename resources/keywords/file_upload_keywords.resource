*** Settings ***
Documentation       File Upload Keywords

Library             Browser
Resource            ../locators/file_upload_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open File Upload Page
    [Documentation]    Opens the browser and navigates to the file upload page.
    New Browser    ${BROWSER}    headless=${HEADLESS}
    New Context
    New Page    ${URL_FILE_UPLOAD}

Upload File
    [Documentation]    Uploads a file using the file input element.
    [Arguments]    ${file_path}
    Upload File By Selector    ${FILE_INPUT}    ${file_path}
    Click    ${SUBMIT_BUTTON}

Verify Uploaded Filename
    [Documentation]    Verifies the uploaded filename is displayed on the page.
    [Arguments]    ${expected_filename}
    Wait For Elements State    ${UPLOADED_FILES}    visible    timeout=10s
    Get Text    ${UPLOADED_FILES}    *=    ${expected_filename}
