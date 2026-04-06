*** Settings ***
Documentation       Add/Remove Elements Locators


*** Variables ***
${ADD_ELEMENT_BUTTON}      button:not(.added-manually)
${DELETE_BUTTON}           button.added-manually
${ELEMENTS_CONTAINER}      id=elements
