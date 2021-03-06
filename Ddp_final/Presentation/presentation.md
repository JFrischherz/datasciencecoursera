Application Pitch Presentation
========================================================
author:Joscha Frischherz
date: 23 December 2016
autosize: true

Overview
========================================================

This presentation outlines the functionality and benefit of the New Year Calculator hosted at: 
https://jfrischherz.shinyapps.io/Assignment_DDP/

The following areas are outlined
- Benefit of application
- Working of Date calculation
- Working of Feedback function

Use case Statement
========================================================

The purpose of the application is to provide the user with a simple view on how many days it will take from any day until the new year 2017.
A potential use case of this functionality is to help the user with the planning of festivies.
Furthermore the application contains a feedback functionality where the author provides his view on the user's response as to whether she or he likes to party.

The application contains two calculations dependent on input. These are outlined in the following slides.

Calculation 1: Date Difference
========================================================

The application calculates the date difference based on the user's selection of a date and compares it to the 1st January 2017.
The folllowing code illustrates the working

```r
#selection of example date
dateSelect <- "2016-12-23"

#hardcoded new years date
newYear <- "2017-01-01"

#using the as.Date function allows us to compare the two dates and get the difference
as.Date(newYear) - as.Date(dateSelect)
```

```
Time difference of 9 days
```


Calculation 2: Feedback function  
========================================================
The second function of the application returns some feedback on the users perception of party. The underlying logic can be illustrated as follows:

Scenario 1 - the user likes to party

```r
#selection of liking to party
selection <- "Yes"

#Feedback Assessment & return
feedback <- if (selection == "Yes" ) {"Rock On!"} else {"Boring!"}
feedback
```

```
[1] "Rock On!"
```

