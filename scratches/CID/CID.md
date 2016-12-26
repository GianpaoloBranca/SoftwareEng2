% **Code Inspection document - v1.0**
%Gianpaolo Branca
 Luca Butera
 Andrea Cini
%![](polimi.png)\newpage

#Introduction

#Classes

###PersistedServiceJob
__Namespace:__ org.apache.ofbiz.service.job  
__Extends:__ GenericServiceJob  
__Implements:__ N/A

###JobPoller
__Namespace:__ org.apache.ofbiz.service.job  
__Extends:__ N/A  
__Implements:__ ServiceConfigListener

#Functional role

#Issues list found by applying the checklist

##PersistedServiceJob

###Naming convention
* Method _longValue_ should start with a verb
* Method _verboseOn_ used at line 116 should start with a verb (hint: _isVerbose_)
* Method _nowTimestamp_ used at line 137 should start with a verb (hint: _getNowTimestamp_)
* Method _infoOn_ used at line 224 should start with a verb and has an ambiguous name

###Indention
* Everything is ok

###Braces
* Single statement _if_ without braces at line 212

###File organization
* Line 83 can be rewritten with an if/else statement to not exceed 80 columns
* Line 114 exceed 120 columns
* Line 142 exceed 120 columns
* Line 153 exceed 120 columns
* Line 159 exceed 120 columns
* Line 187 exceed 120 columns
* Line 249 exceed 120 columns
* Line 259 exceed 120 columns
* Line 288 exceed 120 columns
* Line 323 exceed 120 columns

###Wrapping lines
* Everything ok

------

##JobPoller

###Naming convention
* Method _pollEnabled_ declared at line 154 should start with a verb
* Method _onServiceConfigChange_ declared at line 145 should start with a verb
* Method _remainingCapacity_ used at line 217 should start with a verb (hint: _getremainingCapacity_)
* Method _values_ used at line 220 should start with a verb (hint: _getValues_)
* Method _infoOn_ used at line 224 should start with a verb and has an ambiguous name
* Method _iterator_ used at line 228 should start with a verb

###Indention
* Line 67 starts with a mismatching number of spaces
* Line 71 starts with a mismatching number of spaces

###Braces
* Single statement _if_ without braces at line 224

###File organization
* Line 52 exceed 120 columns
* Line 67 exceed 120 columns
* Line 69 exceed 120 columns
* Line 71 exceed 120 columns
* Line 80 exceed 120 columns

###Wrapping lines
* Everything ok

#Other problems

#Effort spent
