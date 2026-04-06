*** Settings ***
Documentation       Sortable Data Tables Locators


*** Variables ***
${TABLE_1}                  id=table1
${TABLE_2}                  id=table2
${TABLE_1_LAST_NAME_HEADER} css:#table1 thead tr th:nth-child(1) span.arrow
${TABLE_1_FIRST_NAME_SORT}  css:#table1 thead tr th:nth-child(2) a
${TABLE_1_LAST_NAME_SORT}   css:#table1 thead tr th:nth-child(1) a
${TABLE_1_EMAIL_SORT}       css:#table1 thead tr th:nth-child(3) a
${TABLE_1_DUE_SORT}         css:#table1 thead tr th:nth-child(4) a
${TABLE_1_ROWS}             css:#table1 tbody tr
${TABLE_1_FIRST_ROW_LAST}   css:#table1 tbody tr:first-child td:nth-child(1)
${TABLE_1_FIRST_ROW_FIRST}  css:#table1 tbody tr:first-child td:nth-child(2)
