# README #
Following are important variable and their possible values for creating Azure services with these modules.
Although it is not mandetory to follow exactly same values but these values help to set some guidelines and standardization for creating various Azure services with terraform.



## location ##
* indicates location in which service needs to be created.
* Possible values :- can be obtain list of locations by Azure CLI command **az account list-locations --output table**
* e.g. for north Europe :- northeurope

## location_id ##
* short indicator for location
* it follows 2char country/continent code followed by location central,north,west,east .....
* for **northeu**rope it is  euNorth



## environment ##
* It represents envriornment for which this component made for. 
* length 1 to 3 chars
* all small case letters
* Possible values

Value  | Important Note
------------- | -------------
dev  | 	component for **Dev**elopment environment
cit  | 	component specific to **C**omponent **I**ntegration **T**esting
sit  | 	component specific to **S**ystem **I**ntegration **T**esting
uat  | 	component specific to **U**ser **A**cceptance **T**esting
pre	 | 	component specific to **Pre**prod environment
n    |	component which is **not** for production env
p    |	for **P**roduction environment

## cost_centre ##
* It represents entity which will own cost for Azure component.
* Any org can have following cost centres. following values are indicative.
* all small case letters
* length 1 to 4 chars

Possible Cost Centres	|value
---------------------	|----
hr			|hr|
it			|it|
legal			|lgl|
finance			|fin|
wholesale		|whsl|
retail			|rtl|
manufacturing		|mfg|
banking			|bank|
investment		|inv|
marketing		|mkt|

## project ##
* One cost centre can have multiple projects.
* length  Max 5 chars

## version_id ##
* version of this component.everytime when we are updating this component we need to increment it.

## app_service ##
* One Project can have multiple services/functions
 
## seq_id ##
* define unique number for the combination of environment,cost_centre,project and app_service.
* it is numeric value
* max 3 digits i.e. 999

## compliance ##
* possible values **pci** or **none**

## confidentiality ##
Possbile values |Notes
----------------|---------------------------------------------------------------
confidential 	| confidential. access only to specific group of resources in org.
internal 	| not available to public
public		| accessible to everyone

## build_date ##
* date on this component built
* we need to change this value for each time when we are building component
* format ddmmyyyy e.g. 27122017"

## maintenance_day ##
* indication for **day** when this component should undergo maintenance
* 3 char fixed

Possible Values | Notes
----------------|--------
mon		|Monday
tue		|Tuesday
wed		|Wednesday
thu		|Thursday
fri		|Friday
sat		|Saturday
sun		|Sunday

## maintenance_time ##
* indication for **time** when this component should undergo maintenance
* 4 digit fixed.
* it is 24 hours format. e.g. 1330 i.e. 1 pm 30 minutes.


