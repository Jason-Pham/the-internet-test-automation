*** Settings ***
Documentation       Floating Menu Locators


*** Variables ***
${FLOATING_MENU}        id=menu
${HOME_LINK}            [id="menu"] a[href='#home']
${NEWS_LINK}            [id="menu"] a[href='#news']
${CONTACT_LINK}         [id="menu"] a[href='#contact']
${ABOUT_LINK}           [id="menu"] a[href='#about']
${PAGE_CONTENT}         id=page-footer
