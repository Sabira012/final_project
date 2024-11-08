cd "C:/Users/Onbayeva_Sabira/Desktop/final_project"

clear all
set more off, permanently

// Start a log file to capture the output, using the same name as the main script
capture log close
log using "main.log", replace text

// *** Folder Structure ***

cap mkdir data               
cap mkdir output             
cap mkdir output/graphs      
cap mkdir output/tables      
cap mkdir scripts
cap mkdir scripts/stata
cap mkdir scripts/python
           
//***Loading and Inspecting the Dataset***

import delimited "data/used_cars_2cities.csv", varnames(1) bindquotes(strict) encoding("utf-8") clear
browse
describe
summarize

//***Data Cleaning and Preparation***
do scripts/stata/data_cleaning.do

//***Create a summary statistics table and a graph***
do scripts/stata/table_and_graph.do