# Yick!

**Yelp vs. Chicago Food Inspections report.**

## Background on Project
Refactoring of a two day project originally created with Alex Stevenson. Additional help from Amanda Lin.

## Purpose
This website makes it easy cross reference Food Inspection data from the City of Chicago with the [Yelp API] (https://www.yelp.com/developers/documentation/v2/overview).


## Technical Details

**APIs**

City of Chicago data is accessed via the [Socrata Open Data API](https://dev.socrata.com/foundry/data.cityofchicago.org/4ijn-s7e5).

**Backend**

* Ruby/Sinatra
* *soda-ruby* gem (to access Socrata API)
* *hashie* gem (allows for SQL like syntax when accessing Socrata)
