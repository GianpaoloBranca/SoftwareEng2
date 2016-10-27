## Introduction

### Description of the given problem

We need to develop a software management system to support an electric car-sharing service, which is accessible via mobile application both on iOS and android. The main target of the application are the costumers.

-We think that users should be able to park the car they are using in every public parking area of the city

#### Current company situation

The company which wants to provide the car-sharing service is already in the public transport business, therefore they have already a network of maintenance operators in the city area.
They also have an information system which provides channels for costumer care and databases that can be used to store informations about clients and service usage.
The company also has an efficient internal communication system that will be used in our system to be through the provide APIs.

### Goals

We divide the goals in two sections, the first one which contains the goals achieved by modules of the application, and the second one, containing goals achieved by an embedded system installed on the vehicle.

- [G1] Allows the clients to find an available car within a selected radius around his or a specified location.
- [G2] Allows the clients to book a car and pick it up.
- [G3] Monitoring the usage of the car and charge the client with the right fare.
- [G4] Incentivizes a correct usage of the service to allow as many as possible users to use the same car without the need of the service of an operator.
- [G5] Ensures a correct distribution of cars in the recharging stations according to the available plugs.
- [G6] Allows operators to manage and monitor the state of all the cars and notifies them when maintenance is needed on a specific vehicle.
- [G7] Allows management system to set up and modify the set of areas selected as safe for parking.


//[G1] Allows the clients to register, providing the driving license number and a payment method, and log in through the mobile application providing them a   password.
[G2] Allows users to locate a car within a certain distance in a map using their current location or a given address.
[G3]Allows users to reserve only a car at a time and shows the remaining time to pick the car up.
[G4] One hour after a reservation, if the car hasn’t been picked up yet, notifies the client, through a push notification, that the timeout expired and he was charged a fee of 1 Euro.
[G5] Allows the user to unlock the car via mobile application.//

#### Car system:

- [G6] Know when the engine starts to charge the user
- [G7] Uses the car navigator for helping the user and show the position of the recharge stations and safe parking areas
- [G8] Calculates the cost of the trip and show it to the user
- [G9] Allows user to identify themselves scanning a QR code on the car screen

#### Operators:

- [G10] Allows to add and remove safe parking areas and recharge stations in the map
- [G11] Allows to see the status of each car (battery, need for maintenance, last use), highlighting the ones that needs to be picked up



### Boundaries of the system

The system to fulfill the goals that we have identified will use the Google Maps service to locate cars,users,operators and recharging stations and to provide the clients with navigation information.
The system will rely on PayPal as a payment system.
The system will provide operators of the company with the information needed for the maintenance of the vehicle but won’t be worried about the effective fulfillment of the maintenance task.
The system will be able to check if a car is parked in a safe area but won’t be able to check if the car is correctly parked according to laws, anyway data concerning car usage are collected and therefore it is possible to get to the physical person who committed the illicit.


### Domain properties and assumptions

- [D1] The users are allowed to park the car they are using in every public parking area in the boundaries of the city (urban area) and at the company’s recharging stations.
- [D2] The GPS service is always available and provides always the right position.
- [D3] The system cannot prevent theft.
- [D4] Operators are properly trained by the company to use the system and correctly mark cars under maintenance as unavailable.
- [D5] The plugs availability is correctly communicated to the system by the recharging station.
- [D6] User’s mobile phones are equipped with a GPS system and a camera and they are always working properly.
- [D7] The measure of the percentage of battery charge left and the estimation of the Km/% of charge ratio are correct.
- [D8] The internet connection of the cars is always working.
- [D9] Condizioni d'uso
# Glossary

1. Valid credential: Name, surname, birth date, driving licence, paypal account.
2. Current car details: Remaining battery, License plate number, an estimation of the remaining autonomy expressed in kilometers (calculated at average speed of 50 km/h in city traffic), the name and an picture of the car model.

# Text assumptions

==safe areas==

==specify difference between operator and on the road operator==

### Actors identifying

We have three main actors:

Client: is a person who has dowloaded our application and is registered to the service.

Operator: is an employee who has access to an interface that allows him to monitor the state of cars and station and eventually send assistance.

There are also secondary actors (such as third party service providers).

## Requirements
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
  - [R2.1] 

- [G3] Monitoring the usage of the car and charge the client with the right fare.
- [G4] Incentivizes a correct usage of the service to allow as many as possible users to use the same car without the need of the service of an operator.
- [G5] Ensures a correct distribution of cars in the recharging stations according to the available plugs.
- [G6] Allows operators to manage and monitor the state of all the cars and notifies them when maintenance is needed on a specific vehicle.
- [G7] Allows management system to set up and modify the set of areas selected as safe for parking.
