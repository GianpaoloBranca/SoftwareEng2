% **Integration test document - v1.0**
%Gianpaolo Branca
 Luca Butera
 Andrea Cini
 %![](polimi.png)\newpage

##Introduction

###Purpose
This document describe the strategy for testing the integration of components of the PowerEnjoy system, designed in the Design Document presented earlier. It describe the strategy and the tools necessary to fulfil the task.

###Scope
After the design and the development of the components is now the time to put everything together and verify that everything works. This document will be presented to the testing team.

###Definitions
* __Bottom-up:__ a strategy that starts from the lower level to the higher level components.
* __Stub:__ a temporary substitute component that simulate the behaviour of the one that is not already integrated. It is used to test other components that require interaction with this one.
* __Unit test:__ a way to test a single function with assertions
* __Arquillian:__ a framework for JEE for the integration tests

###Abbreviations
* __GUI:__ Graphical unit interfaces
* __GPS:__ Global position system
* __N/A:__ Not applicable

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
The elements that will be integrated are the one described in the components diagram for the cars and the server of our system, described in the design document.

###Integration test strategy
We decided to follow a bottom-up approach because it requires less stubs and bug are easily discovered.  
For the cars, the system will be tested first on a pc with the same linux distribution that the car system have (stubs are used for car sensors and position). After the integration, the system will be deployed and tested on few cars, and if everything is ok all the cars will be equipped with the new software.

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
__Environmental Needs:__ N/A

__Test case identifier:__ C1T2  
__Test items:__ CarController -> GPSManager  
__Input Specification:__  Create typical CarController input  
__Output Specification:__ Check if the correct functions are called and returns the correct position  
__Environmental Needs:__ N/A

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
__Output Specification:__ Check if the correct functions are called
__Environmental Needs:__ N/A

----

###Test Case C7
__Test case identifier:__ C7T1  
__Test items:__  RideController -> NavigationController
__Input Specification:__  Create typical RideController input  
__Output Specification:__ Check if the correct functions are called
__Environmental Needs:__

##Tools and test equipment required

* Arquillian

##program stubs and test data required

###Stubs

####Station Controller
__Usages:__  
__Description:__ this stub is used to test the informations retrieved by the Recharging areas, because using a real net of recharging station would be very expensive and would slow down the test.

####Car Service
__Usages:__  
__Description:__ this stub is used to test the server independently from the the cars, so that the testing for the systems can proceed in parallel.

####Car App server
__Usages:__  
__Description:__ this stub is used to test the car system independently from the the server, so that the testing for the car can proceed in parallel.

####Legacy System
__Usages:__  
__Description:__ this stub is used for simulate the forwarding of a request to the legacy server, because sending many fake requests can interfere with the other tasks of the company.

####PayPal
__Usages:__  
__Description:__ this stub simulate the interaction with PayPal API, avoiding the usage of real money transfers for testing.

####Sensor Controller
__Usages:__  
__Description:__ this stub simulate the interaction with the car sensors, avoiding to break cars each time we want to test if an assistance request is properly sent.

####GPS Manager
__Usages:__  
__Description:__ this stub simulate the interaction with the GPS antenna and return a fake positions, simulating rides. Obviously driving a real car for integration testing is very expensive in terms of money and time.

###Test Data
We will populate the data base with fake users, cars, and safe areas. they will be generated in an automatic way with Arquillian

##Effort spent
