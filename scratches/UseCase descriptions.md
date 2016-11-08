### Use case description

In this section are listed some common or significant use cases derivable from the Use Case diagram.

#### User logs in

**Name:** User logs in  
**Actors:** Non authenticated user  
**Entry conditions:** The user must be registered but hasn't logged on yet.  
**Flow of events:**
- The user enters the login screen of the mobile application.
- The user types in his username and his password.
- The user touches the "Login" button.
- The user is redirected to the car research screen.

**Exit conditions:** The user is redirected on the car research screen.
**Exceptions:** The username and the password are not a valid couple. If this happens the system doesn't allow the user to enter the research screen, however he's notified of the incorrectness of the credentials and therefore is kept on the login screen to try again.

####  User registers

**Name:** User registers  
**Actors:** Non authenticated user  
**Entry conditions:** The user is not registered to the service yet.  
**Flow of events:**  
- The user enters the login screen of the mobile application.
- The user touches the "Register" button.
- The user is redirected to the credential insertion screen.
- The user inserts his name, surname, birth date and driving license ID in any order.
- The user touches the "Next" button.
- The user is redirected to the PayPal account insertion screen.
- The user inputs his PayPal credentials.
- The user touches the "Next" button.
- The user is redirected to the e-mail insertion screen.
- The user types in an e-mail address.
- The user touches the "Confirm" button.
- The system sends a confirmation message to the specified e-mail address.
- The user is redirected to a screen informing him to check is e-mail.
- The user clicks on the link contained in the sent e-mail.
- The system activates the new user's account.
- The user is redirected into the mobile application inside a successful registration screen.
- The user touches the "Confirm" button.
- The user is redirected to the car research screen.

**Exit conditions:** The user is registered and is redirected to the car research screen.  
**Exceptions:** The user inserts invalid PayPal credentials or license ID, personal information do not match license credentials, license or e-mail address are already bounded to an existing profile. In this case the user is notified of the error and is redirected to the login screen.

#### User searches and reserves a car

**Name:** User searches and reserves a car  
**Actors:** User  
**Entry conditions:** The user is logged into the mobile application.  
**Flow of events:**  
- The user enters the car research screen.
- The user types in an address or chooses to use his GPS location.
- The user hits the "Search" button.
- The user is redirected to the map screen showing all the available cars inside the selected area.
- The user clicks on the chosen car.
- The system show a pop-up with the car informations.
- The user hits the "Book now" button.
- The user is redirected to the map screen showing the real time route to the car and the time left before the reservation expires.

**Exit conditions:** The car is correctly reserved and the user is redirected to the map screen.  
**Exceptions:** The chosen car is no more available. In this case the user is notified of the error and redirected to the map screen.

#### User does a full ride with money saving option

**Name:** User does a full ride with money saving option  
**Actors:** User  
**Entry conditions:** The user made a reservation for the car he's about to ride.  
**Flow of events:**  
- The user enters his profile screen.
- The user hits the car reservation inside the history tab.
- The user is redirected to the reservation details screen.
- The user touches the "Unlock" button.
- The system unlocks the car.
- The user enters the car.
- The Car screen power on.
- The user clicks on the QR scanner button.
- The user scans the QR code on the car screen.
- The user powers the engine by pressing the physical button inside the car.
- The user clicks the "Money saving" button on the car screen.
- The car monitor show the destination insertion screen.
- The user inserts his destination and hits the "Confirm" button.
- The system calculates the optimal charge station.
- The car monitor show the GPS navigation map screen with the selected charge station as destination.
- The user rides to his destination.
- The user parks the car at the charge station.
- The user powers down the engine.
- The car monitor show the ride ending screen.
- The user selects the "End ride" button.
- The user is redirected to the plug insertion reminder screen.
- The user exits the car and closes the car door.
- The user inserts the charging plug into the car socket.
- The user is charged for the service usage.

**Exit conditions:** The car is parked and is being recharged. The user is charged for the payment.  
**Exceptions:**  
- In the case there's no compatible charging station the user is redirected to a screen notifying the problem and then back to the initial car screen.
- If the user parks inside the charging station but forgets to insert the plug he's notified after 5 minutes. Then he has 10 additional minutes to insert the plug, if he doesn't then the discount is not applied and he's charged for the full ride.
- The user unlocks the car but doesn't power it up in 15 minutes. If this happens then the car is marked as free and locked up again. **To decide if the user has to pay anything**

#### The user parks and keeps the car as busy

**Name:** The user parks and keeps the car as busy  
**Actors:** User  
**Entry conditions:** The user picked the car up.  
**Flow of events:**  
- The user parks the car and powers down the engine.
- The user is redirected to the ride ending screen.
- The user selects the "Keep as busy" button.
- The user exits the car and closes the car door.
- The system locks the car.
- The user enters his profile screen.
- The user hits the busy car reservation inside the history tab.
- The user is redirected to the reservation details screen.
- The user hits the "Unlock" button.

**Exit conditions:** The user picked up the car again.  
**Exceptions:** The user doesn't unlock the car before two hours passed from the moment he made the car busy. In this case the car is marked as free and the user is charged for the extra time the car was kept busy plus a fine if the car was left outside a safe area.

#### Operator enrolls an assistance request

**Name:** Operator enrolls an assistance request  
**Actors:** Operator  
**Entry conditions:** The operator is logged into the system.  
**Flow of events:**  
- The operator enters the map screen.
- The operator clicks on a flagged car.
- The operator is redirected to a deep car details screen.
- The operator clicks on the "Assistance request" button.
- The system shows a pop-up screen to fill in the request.
- The operator types in the details of the request.
- The operator selects the facility of which the request must be sent to.
- The operator hits the "Send request" button.
- The system attaches the details of the car to the request and sends it.
- The operator is redirected to the map screen.

**Exit conditions:** The request is correctly enrolled to the specified facility. The operator is back on the map screen.  
**Exceptions:** The request can't be enrolled or the operator forgot to fill in one of the fields. In this case the system shows an error screen notifying the problem and asking the operator to try again, then redirects him back to the request screen.

#### Operator inserts a new safe area

**Name:** Operator inserts a new safe area  
**Actors:** Operator  
**Entry conditions:** The operator is logged into the system.  
**Flow of events:**  
- The operator enters the safe areas management screen.
- The operator clicks on the "New safe area" button.
- The operator is redirected to a map screen showing the set of safe areas.
- The operator clicks on the polygonal drawing tool.
- The operator is redirected on the vertices insertion screen.
- The operator inserts the number of vertices.
- The operator hits the "Next" button.
- The operator inserts the coordinates of the vertices then hits the "Next" button for each one of the vertices.
- The operator hits the "Confirm" button.
- The operator is redirected to the map screen now showing the new safe area.
- The operator clicks on the "Save and exit" button.
- The system generates the update details notification.
- The system sends the update details notification to the legal office.
- The operator is redirected to the initial terminal screen.

**Exit conditions:** The new safe area is correctly inserted in the system and the update details notification is successfully sent to the legal office. The operator is redirected to the initial screen.  
**Exceptions:**  
- The operator inserted invalid coordinates for a vertex or an invalid number of vertices. In this case the operator is redirected to the previous screen and notified that he did something wrong and must perform the action again correctly.
- The system, after ten attempts, hasn't been able to send to the legal office the update notification. In this case a warning notification containing the update information is sent to the operator and the operation is taken into account manually. **Is it ok?**  

**ALSO**  
**Do we want to consider the case the new area overlaps an existing one as an exception or will the system just melt the two without generating any problem?**
