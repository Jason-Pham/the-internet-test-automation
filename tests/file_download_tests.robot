*** Settings ***
Documentation       File Download tests — verifies downloadable file links are present and functional.

Library             Browser
Resource            ../resources/variables/global_variables.resource
Resource            ../resources/keywords/file_download_keywords.resource

Suite Setup         New Browser    ${BROWSER}    headless=${HEADLESS}
Suite Teardown      Close Browser

Test Setup          New Context
Test Teardown       Close Context

Test Tags           navigation    file-download


*** Test Cases ***
File Download Page Has Download Links
    [Documentation]    Verifies at least one downloadable file link is available.
    [Tags]    smoke
    Open File Download Page
    Verify Download Links Are Present

First Download Link Has A Filename
    [Documentation]    Verifies the first download link has non-empty text (the filename).
    [Tags]    smoke
    Open File Download Page
    ${text}=    Get First Download Link Text
    Should Not Be Empty    ${text}

Download File Starts Successfully
    [Documentation]    Verifies clicking a download link initiates a file download.
    [Tags]    regression
    Open File Download Page
    ${file_info}=    Download First File
    Should Not Be Empty    ${file_info}[saveAs]
