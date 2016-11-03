### Use case description

In this section are listed some common or significant use cases derivable from the Use Case diagram.

#### Client logs in

**Name:** Client logs in  
**Actors:** Non driver client, Driver client  
**Entry conditions:** The client must be registered but hasn't logged on yet.  
**Flow of events:**
- The client enters the login screen of the mobile application.
- The client types in his username and his password.
- The client touches the "Login" button.
- The client is redirected to the car research screen.

**Exit conditions:** The client is redirected on the car research screen.
**Exceptions:** The username and the password are not a valid couple. If this happens the system doesn't allow the client to enter the research screen, however he's notified of the incorrectness of the credentials and therefore is kept on the login screen to try again.

####  Client registers

**Name:** Client registers  
**Actors:** Non registered client  
**Entry conditions:** The client is not registered to the service yet.  
**Flow of events:**  
- The client enters the login screen of the mobile application.
- The client touches the "Register" button.
- The client is redirected to the credential insertion screen.
- The client inserts his name, surname, birth date and driving license ID in any order.
- The client touches the "Next" button.
- The client is redirected to the PayPal account insertion screen.
- The client inputs his PayPal credentials.
- The client touches the "Next" button.
- The client is redirected to the e-mail insertion screen.
- The client types in an e-mail address.
- The client touches the "Confirm" button.
- The system sends a confirmation message to the specified e-mail address.
- The client is redirected to a screen informing him to check is e-mail.
- The client clicks on the link contained in the sent e-mail.
- The system activates the new client's account.
- The client is redirected into the mobile application inside a successful registration screen.
- The client touches the "Confirm" button.
- The client is redirected to the car research screen.

**Exit conditions:** The client is registered and is redirected to the car research screen.  
**Exceptions:** The client inserts invalid PayPal credentials or license ID, or personal information do not match license credentials.
In this case the client is notified of the error and is redirected to the login screen.

#### Client searches and reserves a car

**Name:** Client searches and reserves a car  
**Actors:** Driver client  
**Entry conditions:** The client is logged into the mobile application.  
**Flow of events:**  
- The client enters the car research screen.
- The client types in an address or chooses to use his GPS location.
- The client inserts the length of the search radius.
- The client hits the "Search" button.
- The client is redirected to the map screen showing all the available cars inside the selected area.
- The client clicks on the chosen car.
- The client is redirected to the details screen.
- The client hits the "Reserve" button.
- The client is redirected to the map screen showing the real time route to the car and the time left before the reservation expires.

**Exit conditions:** The car is correctly reserved and the client is redirected to the map screen.  
**Exceptions:** There are no exceptions for this use case.
