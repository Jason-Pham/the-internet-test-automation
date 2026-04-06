*** Settings ***
Documentation       Add/Remove Elements Locators


*** Variables ***
${ADD_ELEMENT_BUTTON}      css:button[onclick='addElement()']
${DELETE_BUTTON}           css:button.added-manually
${ELEMENTS_CONTAINER}      id=elements
