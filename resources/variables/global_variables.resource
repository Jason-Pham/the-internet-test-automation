*** Settings ***
Documentation       Global Variables


*** Variables ***
${BASE_URL}                     https://the-internet.herokuapp.com
${URL_LOGIN}                    ${BASE_URL}/login
${URL_ABTEST}                   ${BASE_URL}/abtest
${URL_ADD_REMOVE_ELEMENTS}      ${BASE_URL}/add_remove_elements
${URL_BASIC_AUTH}               ${BASE_URL}/basic_auth
${URL_BROKEN_IMAGES}            ${BASE_URL}/broken_images
${URL_CHALLENGING_DOM}          ${BASE_URL}/challenging_dom
${URL_CHECKBOXES}               ${BASE_URL}/checkboxes
${URL_CONTEXT_MENU}             ${BASE_URL}/context_menu
${URL_DISAPPEARING_ELEMENTS}    ${BASE_URL}/disappearing_elements
${URL_DRAG_AND_DROP}            ${BASE_URL}/drag_and_drop
${URL_DROPDOWN}                 ${BASE_URL}/dropdown
${URL_DYNAMIC_CONTENT}          ${BASE_URL}/dynamic_content
${URL_DYNAMIC_CONTROLS}         ${BASE_URL}/dynamic_controls
${URL_DYNAMIC_LOADING_1}        ${BASE_URL}/dynamic_loading/1
${URL_DYNAMIC_LOADING_2}        ${BASE_URL}/dynamic_loading/2
${URL_ENTRY_AD}                 ${BASE_URL}/entry_ad
${URL_EXIT_INTENT}              ${BASE_URL}/exit_intent
${URL_FILE_DOWNLOAD}            ${BASE_URL}/download
${URL_FILE_UPLOAD}              ${BASE_URL}/upload
${URL_FLOATING_MENU}            ${BASE_URL}/floating_menu
${URL_FORGOT_PASSWORD}          ${BASE_URL}/forgot_password
${URL_FRAMES}                   ${BASE_URL}/iframe
${URL_HORIZONTAL_SLIDER}        ${BASE_URL}/horizontal_slider
${URL_HOVERS}                   ${BASE_URL}/hovers
${URL_INFINITE_SCROLL}          ${BASE_URL}/infinite_scroll
${URL_INPUTS}                   ${BASE_URL}/inputs
${URL_JAVASCRIPT_ALERTS}        ${BASE_URL}/javascript_alerts
${URL_KEY_PRESSES}              ${BASE_URL}/key_presses
${URL_MULTIPLE_WINDOWS}         ${BASE_URL}/windows
${URL_NESTED_FRAMES}            ${BASE_URL}/nested_frames
${URL_NOTIFICATION_MESSAGES}    ${BASE_URL}/notification_message
${URL_REDIRECT}                 ${BASE_URL}/redirector
${URL_SHADOW_DOM}               ${BASE_URL}/shadowdom
${URL_TABLES}                   ${BASE_URL}/tables
${URL_STATUS_CODES}             ${BASE_URL}/status_codes
${URL_TYPOS}                    ${BASE_URL}/typos
${URL_WYSIWYG_EDITOR}           ${BASE_URL}/tinymce
${HEADLESS}                     True
${BROWSER}                      chromium
${USERNAME}                     tomsmith
${PASSWORD}                     SuperSecretPassword!
