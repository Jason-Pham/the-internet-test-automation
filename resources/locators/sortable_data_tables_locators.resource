*** Settings ***
Documentation       Sortable Data Tables Locators


*** Variables ***
${TABLE_1}                  id=table1
${TABLE_2}                  id=table2
${TABLE_1_LAST_NAME_SORT}      [id="table1"] thead tr th:nth-child(1)
${TABLE_1_FIRST_NAME_SORT}     [id="table1"] thead tr th:nth-child(2)
${TABLE_1_EMAIL_SORT}          [id="table1"] thead tr th:nth-child(3)
${TABLE_1_DUE_SORT}            [id="table1"] thead tr th:nth-child(4)
${TABLE_1_ROWS}                [id="table1"] tbody tr
${TABLE_1_FIRST_ROW_LAST}      [id="table1"] tbody tr:first-child td:nth-child(1)
${TABLE_1_FIRST_ROW_FIRST}     [id="table1"] tbody tr:first-child td:nth-child(2)
