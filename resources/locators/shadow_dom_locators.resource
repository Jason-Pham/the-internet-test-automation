*** Settings ***
Documentation       Shadow DOM Locators


*** Variables ***
${SHADOW_HOST_1}      css:my-paragraph:nth-of-type(1)
${SHADOW_HOST_2}      css:my-paragraph:nth-of-type(2)
${SHADOW_SLOT_1}      css:my-paragraph:nth-of-type(1) >> internal:has-text("Let's have")
${SHADOW_PARAGRAPH}   css:p
