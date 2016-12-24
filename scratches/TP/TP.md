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

####Car

![](images/CarIntegration.png)

__N = Navigation tests (blue)__, tests concerning the navigation aspect of the system   
__S = Status tests (red)__, tests about the sensors and status of the Car  
__U = User tests (green)__, tests about the user identification  
__G = General tests (black)__, tests that interact with multiple aspect of the system; those test have to be done after the other three categories of tests.

| ID     | Components     |
| :------------- | :------------- |
| N1 | NavigationController -> GPSManager
| N2 | NavigationController -> GoogleMaps
| N3 | RideController -> NavigationController
| N4 | RideController -> CarAppServer
| N5 | NavigationController -> ViewController
| S1 | CarController -> SensorsController
| S2 | CarController -> GPSManager
| S3 | CarController -> CarStatus
| S4 | CarController -> RideController
| S5 | CarController -> ViewController
| U1 | UserIdentification -> CarAppServer
| U2 | RideController -> UserIdentification
| U3 | UserIdentification -> ViewController
| G6 | NotificationManager -> CarAppServer
| G7 | NotificationManager -> CarController
| G8 | NotificationManager -> RideController
| G9 | CarController -> CarInterface
| G10 | ViewController -> GUI   
##Individual steps and test description

###Test Case N1 Version1
__Test case identifier:__ N1T1  
__Test items:__ GPSManager -> NavigationController  
__Input Specification:__ Create a wide range of GPS signals  
__Output Specification:__ Check if the position is managed correctly by the NavigationController  
__Environmental Needs:__ GPS antenna is working

###Test Case N1 Version2
__Test case identifier:__ N1T1  
__Test items:__ NavigationController -> GoogleMaps  
__Input Specification:__  Many GPS requests  
__Output Specification:__ Check if the correct functions are called and returns the correct position in real time  
__Environmental Needs:__ GPS antenna is working

##Tools and test equipment required

##program stubs and test data required

##Effort spent
