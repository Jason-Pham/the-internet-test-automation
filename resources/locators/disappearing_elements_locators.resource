*** Settings ***
Documentation       Disappearing Elements Locators


*** Variables ***
${NAV_MENU}       div.example > ul
${NAV_ITEMS}      div.example ul li
${HOME_LINK}      div.example ul li:first-child a
${GALLERY_LINK}   div.example ul a[href='/gallery']
