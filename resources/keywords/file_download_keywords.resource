*** Settings ***
Documentation       File Download Keywords

Library             Browser
Resource            ../locators/file_download_locators.resource
Resource            ../variables/global_variables.resource


*** Keywords ***
Open File Download Page
    [Documentation]    Opens the browser and navigates to the file download page.
    New Page    ${URL_FILE_DOWNLOAD}

Verify Download Links Are Present
    [Documentation]    Verifies at least one downloadable file link is on the page.
    ${count}=    Get Element Count    ${DOWNLOAD_LINKS}
    Should Be True    ${count} > 0

Get First Download Link Text
    [Documentation]    Returns the text of the first download link.
    ${text}=    Get Text    ${FIRST_LINK}
    RETURN    ${text}

Download First File
    [Documentation]    Clicks the first file link and waits for the download to start.
    ${download}=    Promise To Wait For Download
    Click    ${FIRST_LINK}
    ${file_path}=    Wait For    ${download}
    RETURN    ${file_path}
