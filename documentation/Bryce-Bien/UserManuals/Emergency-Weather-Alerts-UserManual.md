# Emergency Weather Alerts User Manual

## Introduction

The Emergency Weather Alerts feature is designed to keep users informed about potential weather emergencies in their current location as well as locations they search for. It provides timely notifications to ensure user safety during adverse weather conditions.

## How to use

Emergency Weather Alerts are enabled by degfault and are not able to be toggled. When there is a weather emergency in your area/an area you search for, a banner will appear at the top of the screen alerting you of the emergency.

### What determines an emergency

Open Weather API does not provide us with emergency alert data, instead we have a set of parameters to determine if there are adverse weather conditions in your area:

* temperature > 100F or < 5F (or C equivalent)
* visibility < 100m
* wind speed > 100mph
