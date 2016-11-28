% **Design Document - v1.0**
%Gianpaolo Branca
 Luca Butera
 Andrea Cini \newline
%![](polimi.png)\newpage

---
header-includes:
  - \usepackage[dvipsnames]{xcolor}
  - \usepackage{listings}
  - \usepackage{alloy}
---

\newpage

#Introduction

#Architectural Design

##Overview

We are going to build our system following these guidelines:

1. Our application will be implemented using a 3 tiers architecture as it is the most suitable and maintainable one for our system.
2. For the mobile application the client side will be light-weighted, with only the presentation layer as there's no need to perform any kind of data manipulation on the user's mobile phone.
3. The car will be equipped with an embedded system able to retrieve informations from the car sensors (such as the battery level or the presence of mechanical problems). The application running on the car system needs to contain not only presentation features, but also logic to elaborate the data coming from the sensors and manage the execution of a ride without a continuos interaction with the server.
4. The operators will access the system through a web application through a browser in the boundaries of the company network.
