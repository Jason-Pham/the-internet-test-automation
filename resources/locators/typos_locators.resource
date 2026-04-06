*** Settings ***
Documentation       Typos Locators


*** Variables ***
${PARAGRAPHS}       css:div.example p
${FIRST_PARAGRAPH}  css:div.example p:first-child
${SECOND_PARAGRAPH} css:div.example p:last-child
