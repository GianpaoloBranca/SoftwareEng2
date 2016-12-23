% **Integration test document - v1.0**
%Gianpaolo Branca
 Luca Butera
 Andrea Cini
%![](polimi.png)\newpage

##Introduction

###Purpose

###Scope

###Definitions
* Bottom-up: a strategy that starts from the lower level to the higher level components.
* Stub: a fake component that simulate the behaviour of the one that is not already integrated. It is used to test other components that require interaction with this one.
###Abbreviations
* GUI: Graphical unit interfaces
###Reference documents
* Specification document
* RASD
* Design document
* Integration test document sample on Beep
##Integration strategy

###Entry criteria
* Every developed component must be unit tested
* All method exposed by server must be callable
* All GUIs must give the possibility to call all the desired methods in the interfaces, although the GUIs does not have to be refined in details
* Data structures must be defined (JEE entities) and methods that access to the database tested.
* The Database must be populated with test datas
* External services must be callable

###Elements to be integrated

###Integration test strategy
We decided to follow a bottom-up approach because is simpler

###Sequence of component integration

##Individual steps and test description

##Tools and test equipment required

##program stubs and test data required
Since we decided to follow a bottom-up appro
##Effort spent
