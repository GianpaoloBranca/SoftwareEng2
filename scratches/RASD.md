# Requirements Analysis and Specification Document
**Authors:**

  - Gianpaolo Branca
  - Luca Butera
  - Andrea Cini

******

## Introduction

### Description of the given problem

We need to develop a system to support an electric car-sharing service, which is accessible via mobile application both on iOS and android.

### Current company situation

The company which wants to provide the car-sharing service is already in the public transport business, therefore they have already a network of maintenance operators in the city area.
They also have an information system which provides channels for costumer care and databases that can be used to store informations about clients and service usage.
The company also has an efficient internal communication system that will be used in our system to be through the provide APIs.

## Goals

We divide the goals in two sections, the first one which contains the goals achieved by modules of the application, and the second one, containing goals achieved by an embedded system installed on the vehicle.

- [G1] Allows the clients to find an available car within a selected radius around his or a specified location.
- [G2] Allows the clients to book a car and pick it up.
- [G3] Monitoring the usage of the car and charge the client with the right fare.
- [G4] Incentivizes a correct usage of the service to allow as many as possible users to use the same car without the need of the service of an operator.
- [G5] Ensures a correct distribution of cars in the recharging stations according to the available plugs.
- [G6] Allows operators to manage and monitor the state of all the cars and notifies them when maintenance is needed on a specific vehicle.
- [G7] Allows management system to set up and modify the set of areas selected as safe for parking.
- [G8] Provides a real time, interactive, pleasant and transparent user experience.

### Boundaries of the system

- The system to fulfill the goals that we have identified will use the Google Maps service to locate cars,users,operators and recharging stations and to provide the clients with navigation information.
- The system will rely on PayPal as a payment system.
- The system will provide operators of the company with the information needed for the maintenance of the vehicle but won’t be worried about the effective fulfillment of the maintenance task.
- The system will be able to check if a car is parked in a safe area but won’t be able to check if the car is correctly parked according to laws, anyway data concerning car usage are collected and therefore it is possible to get to the physical person who committed the illicit.
- The system will detect and notify the operators when an illegal usage of the system occurs, but will not alert the police force itself.


### Domain properties and assumptions

- [D1] The users are allowed to park the car they are using in every public parking area in the boundaries of the city (urban area) and at the company’s recharging stations.
- [D2] The GPS service is always available and provides always the right position.
- [D3] The system cannot prevent theft.
- [D4] Operators are properly trained by the company to use the system and correctly mark cars under maintenance as unavailable.
- [D5] The plugs availability is correctly communicated to the system by the recharging station.
- [D6] User’s mobile phones are equipped with a GPS system and a camera and they are always working properly.
- [D7] The measure of the percentage of battery charge left and the estimation of the Km/% of charge ratio are correct.
- [D8] The internet connection of the cars is always working.
- [D9] The user has accepted the terms of use of the application.
- [D10] Every car is equipped with a display.

### Glossary

1. Valid credential: Name, surname, birth date, driving license, PayPal account, valid e-mail address.
2. Current car details: Remaining battery, License plate number, an estimation of the remaining autonomy expressed in kilometers (calculated at average speed of 50 km/h in city traffic), the name and an picture of the car model.
3. Money saving option: An option that if on will provide the user with the information to find a suitable recharging station according to his the destination, the availability of plugs and uniform distribution of cars among the stations.
4. Safe area: area flagged by the management system as suitable for leaving the car and ending the ride.
5. Operator: in this document we refer as operator to the employees in charge of monitoring the state of the car in from dedicated terminals of the company.
6. On screen notification: is a notification which is displayed on the screen located inside the vehicle.
7. Plugged: a car is considered plugged when a sensor in the recharging station detects that the specific car has been connected to the recharging system.
8. Busy: a car is marked as busy when left parked by a client but kept booked.

### Text assumptions


1. Discounts and penalties will be applied only in the case of ride not shorter than 2km, so that the system will not punish users for not using poorly charged cars for short rides and will not encourage users to use fully charged cars less to get the discount.
2. Discounts and penalties percentage values can be customized by the management system.

### Actors identifying

We have two main actors:

Client: is a person who has dowloaded our application and is registered to the service.

Operator: is an employee who has access to an interface that allows him to monitor the state of cars and station and eventually send assistance.

There are also secondary actors (such as third party service providers).

## Requirements

#### Functional Requirements

In the following section we are going to identify the requirements that our system will have to fulfill to meet reach the goals.

- [G0] Users must be able to access to the system

  - [R0.1] User must sign up with valid credential
  - [R0.2] System must generates a password for the user
  - [R0.3] User must be able to visualize and modify all his personal informations


- [G1] Allows the clients to find an available car within a selected radius around his or a specified location.

  - [R1.1] The system must retrieve the location of the user
  - [R1.2] The user must be able to specify the radius (in km) around the selected location for the car research
  - [R1.3] The system must return to the user a map with the location of all the available cars around the chosen position
  - [R1.4] Upon the selection of a car the system must retrieve an informative screen with current car details.


- [G2] Allows the clients to book a car and pick it up.

 - [R2.1] A client must be able to choose one of the available cars and, if PayPal ensures that he can pay, book it.
 - [R2.2] Once a car has been booked no others reservation can be performed by the same client until the first one is pending.
 - [R2.3] After the reservation has been confirmed to the client, he has a maximum of 1 hour to reach the car, unlock it and start the engine. If the timeout expires the reservation is cancelled and the fee is applied.
 - [R2.4] The client is able to unlock a booked car trough the app at any time after the reservation, however he has a maximum of 15 minutes to turn it on after the unlocking. If this timeout expires, the reservation is cancelled the fee is applied.


- [G3] Monitoring the usage of the car and charge the client with the right fare.

 - [R3.1] As soon as the engine starts the system must start charging the user with a fixed amount for minute and show the current price of the ride in the display of the car.
 - [R3.2] When a car is parked in a safe area and the engine is turned off the system will ask the user through the display of the car if he wants to keep the car busy for at maximum 2h, if the user select 'NO' or does nothing and leaves the car the ride is considered as ended. If the user selects 'YES' the car is marked as busy.
 - [R3.3] A user can leave the car but keep it busy with a time limit of 2 hours, during this time since the battery is not being used the management may configure a different fare. When the timeout expires if the car hasn't been picked up yet the client will be charged with the price of the ride up to that point.
 - [R3.4] A car parked in a place not marked as safe will be considered as busy, but if the client breaks the 2 hours timeout he will get fine for improper use of the service (plus the regular price for the ride). The situation will be notified to the operators that will be able to decide if the car needs to be picked or not.
 - [R3.5] If the user drives outside the boundaries of the area of the service, the system must detect it, notify it to the user at first and apply an additional time fare as a penalty. After 30 minutes an operator will be notified of the situation.
 - [R3.6] If the signal of a car is lost for more than 10 minutes, an operator will be notified with the last known position.
 - [R3.7] After the end of the ride the user is charged with the right amount.


- [G4] Incentivizes a correct usage of the service to allow as many as possible users to use the same car without the need of the service of an operator.(Note that discounts and penalties will not be applied to short rides, further details in Text Assumption n.4)

  - [R4.1] The system will show in the display of the car a QR code that must be scanned by the user, using the application, to check in. If 2 or more users check in, in addition to the driver, a discount will be applied to the ride.
  - [R4.2]  The system will apply a discount in the case a car is left with more the 50% of the battery capacity available.
  - [R4.3] The system will detect when a car is left plugged in a recharging station at the end of a ride (using the GPS sensor and the informations sent to the system by the station) and will apply a discount . If the car is left in the recharging station but not plugged within 5 minutes the discount will not be applied.
  - [R4.4] The system will detect when a car is about to be left more than 3km away from the nearest recharging station and with 20% or less battery available, will warn the client and if the client proceeds to leave the car will apply a penalty to the price of the ride.
  - R[4.5] The client will be able to select a money saving option so that the system will provide him trough the GPS navigator of the car informations to reach the available recharging station which is more suitable according to the client destination and the need of the system to distribute car uniformly among the recharging stations.


- [G5] Ensures a correct distribution of cars in the recharging stations according to the available plugs.

  - [R5.1] The system will help operators (in the case there's no need for an on place recharge) and users with the money saving option on to choose the station in which cars should be charged and left so that cars are reasonably distributed among the different stations in the city.
  - [R5.2] The amount of plugs available should be monitored and the presence of non working ones detected.


- [G6] Allows operators to manage and monitor the state of all the cars and notifies them when maintenance is needed on a specific vehicle.

  - [R6.1] The system will provide operators of the company with an interface to check the state of the cars.
  - [R6.2] Push notifications will notify when a car is need for assistance.
  - [R6.3] Cars with low battery level which are not likely to be used anymore will be flagged.
  - [R6.4] The system must provide APIs to be used to the old system that will manage the assistance action.


- [G7] Allows management system to set up and modify parameters of the system.

 - [R7.1] The system will provide an interface to select areas to mark as safe areas for parking. The selection of the locations will be possible specifying the boundaries of the areas using a map or a radius around an address.
 - [R7.2] The system will provide an interface to select the price for minute of the rides and during the busy state.
 - [R7.3] The system will provide and interface to customize the percentage of discount and penalty for the cases highlighted in the G.4 scope.


- [G8] Provides a real time, interactive, pleasant and transparent user experience.

 - [R8.1] At the end of each ride the system must notify the user with all the informations concerning the last usage, among which the total amount charged and details about eventual discounts or penalties.
 - [R8.2] If at the beginning of a ride the client is suitable for the discount of which at [R4.1], the system notifies the correct detection with an on screen notification.
 - [R8.3] At the end of a ride, if the user results parked inside a charging station, the system reminds him to insert the plug in the specific socket to get the discount of which at [R4.4] using an on screen notification. **To check**

#### Non-functional Requirements

 - The mobile application must work on all the android with version 4.3 or newer and iOS 7 or newer.
 - The system must optimize bandwidth usage to guarantee a responsive service and to know the position of a car real time.
 - For communication, secure protocols must be used.
