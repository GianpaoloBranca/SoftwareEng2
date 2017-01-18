% **Code Inspection document - v1.0**
%Gianpaolo Branca
 Luca Butera
 Andrea Cini
%![](polimi.png)\newpage

#1 Introduction

#2 Classes

###2.1 PersistedServiceJob
__Namespace:__ org.apache.ofbiz.service.job  
__Extends:__ GenericServiceJob  
__Implements:__ N/A  

__Methods:__  

###2.2 JobPoller
__Namespace:__ org.apache.ofbiz.service.job  
__Extends:__ N/A  
__Implements:__ ServiceConfigListener  

__Methods:__
    * Line 59: getInstance()
    * Line 63: createThreadPoolExecutor()
    * Line 75: pollWaitTime()
    * Line 91: registerJobManager(JobManager jm)
    * Line 114: getPoolState()
    * Line 145: onServiceConfigChange(ServiceConfig serviceConfig)
    * Line 154: pollEnabled()
    * Line 168: queueNow(Job job)
    * Line 181: stop()

#3 Functional role

###3.1 PersistedServiceJob

PersistedServiceJob -> GenericServiceJob -> AbstractJob -> Job -> Runnable

###3.2 JobPoller

#4 Issues list found by applying the checklist

##4.1 PersistedServiceJob

###Naming convention
* Method _longValue_ should start with a verb
* Method _verboseOn_ used at line 116 should start with a verb (hint: _isVerbose_)
* Method _nowTimestamp_ used at line 137 should start with a verb (hint: _getNowTimestamp_)
* Method _infoOn_ used at line 224 should start with a verb and has an ambiguous name
* Variable _next_ at line 179 should have a more meaningful name
* Variable _next_ at line 251 should have a more meaningful name

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

###Comments
* In the JavaDoc of PersistedServiceJob class "JobSandbox" refers to the entity jobValue and should be renamed
(see line 96 to 100 for an example). No class named JobSandbox exists in the project.

###Java source file
* Everything ok

###Package and import statements
* Everything ok

###Class and interface declaration
* Method _deQueue_ should be grouped with _queue_

###Initialization and declaration
* _cancelTime_ not declared at the beginning of block at line 104 __?__
* _startTime_ not declared at the beginning of block at line 105 __?__
* _maxRecurrenceCount_ not declared at the beginning of block at line 148 __?__
* _currentRecurrenceCount_ not declared at the beginning of block at line 149 __?__
* _expr_ not declared at the beginning of block at line 150 __?__
* _recurrence_ not declared at the beginning of block at line 151 __?__
* _next_ not declared at the beginning of block at line 179
* _newJob_ not declared at the beginning of block at line 197
* _jobResult_ not declared at the beginning of block at line 222
* _next_ not declared at the beginning of block at line 251
* _count_ not declared at the beginning of block at line 321 __?__

###Method calls

###Arrays

###Object comparison

###Output format

###Computation, Comparisons and Assignments

###Exceptions
* Everything ok

###Flow of Control
* Everything ok, no switches and no loops

###Files
* Everything ok, no files
---

##JobPoller

###Naming convention
* Method _pollEnabled_ declared at line 154 should start with a verb
* Method _onServiceConfigChange_ declared at line 145 should start with a verb
* Method _remainingCapacity_ used at line 217 should start with a verb (hint: _getRemainingCapacity_)
* Method _values_ used at line 220 should start with a verb (hint: _getValues_)
* Method _infoOn_ used at line 224 should start with a verb and has an ambiguous name
* Method _iterator_ used at line 228 should start with a verb
* Variable _created_ at line 51 should have a more meaningful name

###Indention
* Line 67 starts with a mismatching number of spaces ?
* Line 71 starts with a mismatching number of spaces ?

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

###Comments
* Everything ok

###Java source file
* Everything ok

###Package and import statements
* Everything ok

###Class and interface declaration
* Variable _jobManagerPollerThread_ declared ad line 98 should be declared after the static variables

###Initialization and declaration
* _serviceName_ not declared at the beginning of block at line 131
* _queueCandidates_ not declared at the beginning of block at line 231 __?__
* _addingJobs_ not declared at the beginning of block at line 232 __?__

###Method calls

###Arrays

###Object comparison

###Output format

###Computation, Comparisons and Assignments

###Exceptions
* Catch block at line 172 should log the exception.
* Line 192?
* Catch block at line 254 should log the exception.

###Flow of Control
* Everything ok, no switches

###Files
* Everything ok, no files

#Other problems

#Effort spent
