//***Clean Missing Data***

drop if missing(price)| missing(subarea) | missing(condition) | missing(cylinders) | missing(drive) | missing(paintcolor) | missing(size) | missing(type) | missing(odometer) 

drop if price == "NA"
drop if subarea == "NA"
drop if condition == "NA"
drop if cylinders == "NA"
drop if drive == "NA"
drop if paintcolor == "NA"
drop if size == "NA"
drop if type == "NA"
drop if odometer == "NA"

//convert a variable from string (text) format to numeric, if the data should be numeric
destring odometer, replace

replace price = subinstr(price, "$", "", .)  // Remove "$" sign
destring price, replace  

replace cylinders = subinstr(cylinders, " cylinders", "", .) // Remove " cylinders" destring cylinders 
destring cylinders, replace 

//***Filter and Transform Data***
// Filter observations to keep only cars with odometer below 100,000
keep if odometer < 100000

// Keep only the specified variables
keep price odometer condition cylinders

// Create a new variable price_per_mile
gen price_per_mile = price / odometer

// Save the filtered and transformed dataset
save "data/filtered_sample.dta", replace