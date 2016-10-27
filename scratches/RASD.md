## Introduction

### Description of the given problem

We need to develop a software management system to support an electric car-sharing service, which is accessible via mobile application both on iOS and android. The main target of the application are the costumers.

-We think that users should be able to park the car they are using in every public parking area of the city

### Goals

We divide the goals in two sections, the first one which contains the goals achieved by modules of the application, and the second one, containing goals achieved by an embedded system installed on the vehicle.

- [G1] Allows the clients to find an available car around his or a specified location within a radius that he can choose.
- [G2] Allows the clients to book a car and pick it up.
- [G3] Monitoring the usage of the car and charge the client with the right fare.
- [G4] Incentivizes a correct usage of the service to allow as many as possible users to use the same car without the need of the service of an operator.
- [G5] Ensures a correct distribution of cars in the recharging stations according to the available plugs.
- [G6] Allows operators to manage and monitor the state of all the cars and notifies them when maintenance is needed on a specific vehicle.
- [G7]


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
The system won’t be able to check if a car is parked in a safe area or not, but


### Domain properties and assumptions

- [D1] The users are allowed to park the car they are using in every public parking area in the boundaries of the city (urban area) and at the company’s recharging stations.
- [D2] The GPS service is always available and provides always the right position.
- [D3] The system cannot prevent theft.
- [D4] Operators are properly trained by the company to use the system and correctly mark cars under maintenance as unavailable.
- [D5] The plugs availability is correctly communicated to the system by the recharging station.
- [D6] User’s mobile phones are equipped with a GPS system and a camera and they are always working properly.
- [D7] The measure of the percentage of battery charge left and the estimation of the Km/% of charge ratio are correct.
- [D8] Domain assumption the internet connection of the cars is always working.
