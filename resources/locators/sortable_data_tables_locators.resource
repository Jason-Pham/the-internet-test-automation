*** Settings ***
Documentation       Sortable Data Tables Locators


*** Variables ***
${TABLE_1}                  id=table1
${TABLE_2}                  id=table2
${TABLE_1_LAST_NAME_HEADER}  #table1 thead tr th:nth-child(1) span.arrow
${TABLE_1_FIRST_NAME_SORT}  #table1 thead tr th:nth-child(2) a
${TABLE_1_LAST_NAME_SORT}   #table1 thead tr th:nth-child(1) a
${TABLE_1_EMAIL_SORT}       #table1 thead tr th:nth-child(3) a
${TABLE_1_DUE_SORT}         #table1 thead tr th:nth-child(4) a
${TABLE_1_ROWS}             #table1 tbody tr
${TABLE_1_FIRST_ROW_LAST}   #table1 tbody tr:first-child td:nth-child(1)
${TABLE_1_FIRST_ROW_FIRST}  #table1 tbody tr:first-child td:nth-child(2)
