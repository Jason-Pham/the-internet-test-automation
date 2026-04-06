*** Settings ***
Documentation       Floating Menu Locators


*** Variables ***
${FLOATING_MENU}        id=menu
${HOME_LINK}            css:#menu a[href='#home']
${NEWS_LINK}            css:#menu a[href='#news']
${CONTACT_LINK}         css:#menu a[href='#contact']
${ABOUT_LINK}           css:#menu a[href='#about']
${PAGE_CONTENT}         id=page-footer
