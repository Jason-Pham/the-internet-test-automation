*** Settings ***
Documentation       Disappearing Elements Locators


*** Variables ***
${NAV_MENU}       css:ul.nav
${NAV_ITEMS}      css:ul.nav li
${HOME_LINK}      css:ul.nav li:first-child a
${GALLERY_LINK}   css:ul.nav a[href='/gallery']
