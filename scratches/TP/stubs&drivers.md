# 5 Program stubs/drivers and test data required

## 5.1 Stubs

### 5.1.1 PWEService

#### CarSystem
__Usages:__ in every test that involve components that communicates with the CarSystem  
__Description:__ this stub simulate a fake car to be called so the integration test of the CarSystem can be done in parallel with the PWEService.

#### Legacy System
__Usages:__ WA4  
__Description:__ this stub is used for simulate the forwarding of a request to the legacy server, because sending many fake requests can interfere with the other tasks of the company.

#### NotificationController
__Usages:__ in every test that involve components that send notifications.  
__Description:__ since the NotificationController integration is not crucial, this stub is used everywhere before the integration with the subsystems so that instead of send real notifications the messages are only written in a log.

### 5.1.2 CarSystem

#### PWEService
__Usages:__ in every test that involve components that communicates with the PWEService  
__Description:__ this stub simulate a fake server to be called so the integration test of the CarSystem can be done in parallel with the PWEService.

#### Sensor Controller
__Usages:__ all tests done in Step 1 of the integration  
__Description:__ this stub simulate the interaction with the car sensors without using a real car for calling the SensorsController when car parameters are needed.

#### GPS Manager
__Usages:__ all tests done in the Step 1 of the integration  
__Description:__ this stub simulate the interaction with the GPS antenna and return a fake positions, simulating rides.

#### NavigationController
__Usages:__ CPRES tests  
__Description:__ this stub is used for test the presentation layer in parallel with the other parts, in particular is used for the calls done from the ViewController.

## 5.2 Drivers

### 5.2.1 PWEService

#### CarSystem
__Usages:__ in every test that involve components that are called from the CarSystem  
__Description:__ this driver simulate the calls from a fake car so the integration test of the CarSystem can be done in parallel with the PWEService.

#### MonitoringWebApp
__Usages:__ WA tests  
__Description:__ this driver is used to call the WebAppServer APIs before the integration with the final Web application.  

#### MobileApp
__Usages:__ APP tests  
__Description:__ this driver is used to call the ServiceAPIs without exposing it online.

#### StationController
__Usages:__ DA7  
__Description:__ this driver is used to test the function called on the DataAccessManager from the StationController, because using a real recharging station would be very expensive and would slow down the test.

### 5.2.2 CarSystem

#### PWEService
__Usages:__ in every test that involve components that are called from the PWEService  
__Description:__ this driver simulate the calls from a fake server so the integration test of the CarSystem can be done in parallel with the PWEService.

#### SensorsController
__Usages:__ all tests done in Step 1 of the integration
__Description:__  this stub simulate the interaction with the car sensors without using a real car for calling the CarController when a problem occurs.

#### RideController, CarController, NavigationController
__Usages:__ CPRES tests
__Description:__ these drivers are used to call function on the presentation layer so the tests can be done in parallel.

## 5.3 Test Data
We will populate the data base with fake users, cars, and safe areas. they will be generated in an automatic way with Arquillian
