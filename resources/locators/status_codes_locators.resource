*** Settings ***
Documentation       Status Codes Locators


*** Variables ***
${LINK_200}       css:a[href='status_codes/200']
${LINK_301}       css:a[href='status_codes/301']
${LINK_404}       css:a[href='status_codes/404']
${LINK_500}       css:a[href='status_codes/500']
${PAGE_TEXT}      css:div.example p
${BACK_LINK}      css:div.example p a
