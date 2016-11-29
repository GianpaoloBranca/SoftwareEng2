% **Design Document - v1.0**
%Gianpaolo Branca
 Luca Butera
 Andrea Cini \newline
%![](polimi.png)\newpage

\newpage

#Introduction

##Purpose
The purpose of this document is to provide technical informations about the service we are going to deploy described in the RASD.

##Scope
Our service is about electric car sharing to provide a valid option to public transportation for low length trips.
It is provided via mobile application for the final users and via web application for the operators of the company.
Users can download the app with the Android play store or with the Apple store. Operators can enter the system directly from a browser in the boundaries of the companies network after logging in.

##Definitions, Acronyms, Abbreviations

##Reference documents
* RASD
* Specification document

#Architectural Design

##Overview

We are going to build our system following these guidelines:

1. Our application will be implemented using a 3 tiers architecture as it is the most suitable and maintainable one for our system.
2. For the mobile application the client side will be light-weighted, with only the presentation layer as there's no need to perform any kind of data manipulation on the user's mobile phone.
3. The car will be equipped with an embedded system able to retrieve informations from the car sensors (such as the battery level or the presence of mechanical problems)through OBD. The application running on the car system needs to contain not only presentation features, but also logic to elaborate the data coming from the sensors and manage the execution of a ride without a continuos interaction with the server.
4. The operators will access the system through a web application through a browser in the boundaries of the company network.
5. Integration with the legacy server will happen trough its APIs for the purpose of providing maintenance to the cars and clients care.
6. The application server implements the logic of the system.
7. The data base contain the data for the system and it is independent from the legacy system for flexibility.

## Component view

## Deployment view

## Runtime view

## Component Interfaces

## Selected architectural styles and pattern

We will develop our system as a 3 tiers application as specified in the overview section.

* Mobile app: we will follow the remote presentation pattern.
* Monitoring web app: distributed presentation.
* Car system: distributed logic.

The reasons for this kind of architectural choices has already been discussed in the overview.

### Design Patterns

These are the main design patterns that we are following in the design process:

* Model-Control-View : used pretty much everywhere, it's a really good choice of design that allow to keep very clear the role of every component of the system and that makes the system easy to deploy and maintain.
* Client-server : the staple good practice of a web based system.


## Other design decisions

# Algorithm design

# User Interface design

# Requirements Traceability

# Effort spent
