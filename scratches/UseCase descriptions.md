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
- The user inserts the length of the search radius.
- The user hits the "Search" button.
- The user is redirected to the map screen showing all the available cars inside the selected area.
- The user clicks on the chosen car.
- The user is redirected to the details screen.
- The user hits the "Reserve" button.
- The user is redirected to the map screen showing the real time route to the car and the time left before the reservation expires.

**Exit conditions:** The car is correctly reserved and the user is redirected to the map screen.  
**Exceptions:** The chosen car is no more available. In this case the user is notified of the error and redirected to the map screen.
