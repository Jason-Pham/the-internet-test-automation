*** Settings ***
Documentation       Hovers Locators


*** Variables ***
${FIGURE_1}              css:div.figure:nth-child(1)
${FIGURE_2}              css:div.figure:nth-child(2)
${FIGURE_3}              css:div.figure:nth-child(3)
${FIGURE_CAPTION_1}      css:div.figure:nth-child(1) div.figcaption
${FIGURE_CAPTION_2}      css:div.figure:nth-child(2) div.figcaption
${FIGURE_CAPTION_3}      css:div.figure:nth-child(3) div.figcaption
${FIGURE_LINK_1}         css:div.figure:nth-child(1) div.figcaption a
${FIGURE_LINK_2}         css:div.figure:nth-child(2) div.figcaption a
${FIGURE_LINK_3}         css:div.figure:nth-child(3) div.figcaption a
