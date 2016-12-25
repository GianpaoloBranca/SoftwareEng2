% **Integration test document - v1.0**
%Gianpaolo Branca
 Luca Butera
 Andrea Cini
 %![](polimi.png)\newpage

##Introduction

###Purpose
This document describe the strategy for testing the integration of components of the PowerEnjoy system, designed in the Design Document presented earlier.

###Scope

###Definitions
* __Bottom-up__: a strategy that starts from the lower level to the higher level components.
* __Stub__: a temporary substitute component that simulate the behavior of the one that is not already integrated. It is used to test other components that require interaction with this one.

###Abbreviations
* __GUI__: Graphical unit interfaces

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

###Car

![](images/CarSystem.png)

##Individual steps and test description

---

###Test Case C1
__Test case identifier:__ C1T1  
__Test items:__ NavigationController -> GPSManager  
__Input Specification:__  Create typical NavigationController requests  
__Output Specification:__ Check if the correct functions are called and returns the correct position  
__Environmental Needs:__ GPS antenna is working

__Test case identifier:__ C1T2  
__Test items:__ CarController -> GPSManager  
__Input Specification:__  Create typical CarController input  
__Output Specification:__ Check if the correct functions are called and returns the correct position  
__Environmental Needs:__ GPS antenna is working  

----

###Test Case C2
__Test case identifier:__ C2T1  
__Test items:__ CarController -> SensorsController  
__Input Specification:__  Create typical CarController input  
__Output Specification:__ Check if the correct functions are called and returns the correct datas  
__Environmental Needs:__ N/A

----

###Test Case C3
__Test case identifier:__ C3T1  
__Test items:__ CarController -> CarStatus  
__Input Specification:__  Create typical CarController input  
__Output Specification:__ Check if the correct functions are called and the CarStatus is consistent  
__Environmental Needs:__ C2 succeeded

----

###Test Case C4
__Test case identifier:__ C4T1  
__Test items:__ ViewController -> GUI  
__Input Specification:__  Create typical ViewController input  
__Output Specification:__ Check if the correct functions are called and the informations are properly displayed  
__Environmental Needs:__ N/A

----

###Test Case C5
__Test case identifier:__ C5T1  
__Test items:__ NavigationController -> ViewController  
__Input Specification:__  Create typical NavigationController input  
__Output Specification:__ Check if the correct functions are called
__Environmental Needs:__ C4 Succeeded

__Test case identifier:__ C5T2  
__Test items:__ CarController -> ViewController  
__Input Specification:__  Create typical CarController input  
__Output Specification:__ Check if the correct functions are called
__Environmental Needs:__ C4 Succeeded

__Test case identifier:__ C5T3  
__Test items:__ UserIdentification -> ViewController  
__Input Specification:__  Create typical UserIdentification input  
__Output Specification:__ Check if the correct functions are called
__Environmental Needs:__ C4 Succeeded, CarAppServer available

----

###Test Case C6
__Test case identifier:__ C6T1  
__Test items:__  RideController -> UserIdentification  
__Input Specification:__  Create typical RideController input  
__Output Specification:__ Check if the correct functions are called and users datas are properly managed  
__Environmental Needs:__ N/A

###Test Case C7
__Test case identifier:__ C7T1  
__Test items:__  RideController -> NavigationController
__Input Specification:__  Create typical RideController input  
__Output Specification:__ Check if the correct functions are called and datas are properly managed
__Environmental Needs:__

##Tools and test equipment required

##program stubs and test data required

##Effort spent
