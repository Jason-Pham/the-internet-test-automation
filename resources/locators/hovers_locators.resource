*** Settings ***
Documentation       Hovers Locators


*** Variables ***
${FIGURE_1}              div.figure:nth-of-type(1)
${FIGURE_2}              div.figure:nth-of-type(2)
${FIGURE_3}              div.figure:nth-of-type(3)
${FIGURE_CAPTION_1}      div.figure:nth-of-type(1) div.figcaption
${FIGURE_CAPTION_2}      div.figure:nth-of-type(2) div.figcaption
${FIGURE_CAPTION_3}      div.figure:nth-of-type(3) div.figcaption
${FIGURE_LINK_1}         div.figure:nth-of-type(1) div.figcaption a
${FIGURE_LINK_2}         div.figure:nth-of-type(2) div.figcaption a
${FIGURE_LINK_3}         div.figure:nth-of-type(3) div.figcaption a
