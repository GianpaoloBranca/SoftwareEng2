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

# Architectural Design

## Overview

We are going to build our system following these guidelines:

1. Our application will be implemented using a multi-tier architecture as it is the most suitable(this point will be clear in the next steps) and maintainable one for our system.

2. For the mobile application the client side will be light-weighted, with only the presentation layer as there's no need to perform any kind of data manipulation on the user's mobile phone.

3. The car will be equipped with a general purpose system (with a stable Linux distribution as OS) with an our application running.

  - Our application will be able to retrieve informations from the car sensors (such as the battery level or the presence of mechanical problems)through OBD.
  - The application needs to contain not only presentation features, but also logic to elaborate the data coming from the sensors and manage the execution of a ride without a continuos interaction with the server.

4. The operators will access the system through a web application.

5. Integration with the legacy server will happen trough its APIs for the purpose of providing maintenance to the cars and clients care.


## Component view

## Deployment view

## Runtime view

## Component Interfaces

## Selected architectural styles and pattern

### Business Logic Layer

* We will develop our server BL using the Java EnterpriseEdition framework .

  - JEE will allow us to shorten the development time and to achieve high performances while keeping our application complexity manageable.
  - JEE makes our project use architectural structure that follows well-known best practices.

* We will use Oracle GlassFish Server (the commercial edition) as application server.

  - GlassFish gives very good performance guarantees and is well supported.

* We will use the JAX-RS and JAXB APIs to expose RESTful APIs with XML that will be used client-side to interface with the web server.

  - The usage of the RESTful standard will give our system robustness and flexibility.
  - This will allow us to use Adobe PhoneGap to develop an hybrid multi-platform application for the client side.


### Design Patterns

These are the main design patterns that we are following in the design process:

* Model-Control-View : used pretty much everywhere, it's a really good choice of design that allow to keep very clear the role of every component of the system and that makes the system easy to deploy and maintain.
* Client-server : the staple good practice of a web based system.


## Other design decisions

# Algorithm design

# User Interface design

# Requirements Traceability

# Effort spent
