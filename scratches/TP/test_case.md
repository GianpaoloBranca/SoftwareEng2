Results for null parameters or invalid parameters, if the outcome isn't explicitly specified, always end up in a NullArgumentException for the former and InvalidArgumentException for the latter.

### Test case CAR1

**Test case identifier:** CAR1  
**Test items:** CarController -> CarStatus  
**Environmental needs:** N/A  

The CarStatus is a rather simple component since it only contains a representation of the current status of the car. Therefore the purpose of this test case is to assure that the CarController correctly updates the CarStatus and retrieves informations from it.

### Test case CAR2

**Test case identifier:** CAR2  
**Test items:** RideController -> NavigationController  
**Environmental needs:** N/A  

Even though the NavigationController handles all the navigation process, communicating with the GPSManager and the GMaps interface, its interaction with the RideController is rather simple as we stated for CAR1. So, also in this test case, is needed to assure that RideController retrieves correctly the navigation informations and that is able to properly send the destinations computed by the PWEService.

### Test case CAR3

**Test case identifier:** CAR3  
**Test items:** RideController <-> CarController  
**Environmental needs:** N/A  

Here we test the integration of two critical components of the CarSystem, reason why a more "in-depth" explanation of the test case and expectations is provided.

+-----------------------------------------------+
| reqCodeVerification(code) |
+-----------------------------------------------+

+----------------------+-----------------------+
| Input                | Effect |
+----------------------+-----------------------+
| A null parameter     | A NullArgumentExcpetion is raised |
+----------------------+-----------------------+
| An invalid parameter | A InvalidArgumentException is raised |
+----------------------+-----------------------+
| A non matching code  | An InvalidCheckInCode Notification is sent back |
+----------------------+-----------------------+
| A matching code      | A ValidCheckInCode Notification is sent back |
+----------------------+-----------------------+

+-------------------------------+
| generateQR() |
+-------------------------------+

+-----------------------------+--------------------------+
| Input                       | Effect |
+-----------------------------+--------------------------+
| N/A                         | a valid QR code is generated |
+-----------------------------+--------------------------+

+-------------------------------+
| rideEnded() |
+-------------------------------+

+------------------------+---------------------+
| Input                  | Effect |
+------------------------+---------------------+
| N/A                    | The locking routine starts and an ACK is sent back |
+------------------------+---------------------+

+----------------------+
| checkPlugged() |
+----------------------+

+-----------------------+--------------------+
| Input                 | Effect             |
+-----------------------+--------------------+
| N/A                   | the correct truth value representing if the car is plugged or not is returned |
+-----------------------+--------------------+

+----------------------+
| retrieveCarData() |
+----------------------+

+------------------------+-------------------------+
| Input                  | Effect                  |
+------------------------+-------------------------+
| N/A                    | up to date car status is returned |
+------------------------+-------------------------+

### Test case CAR4

**Test case identifier:** CAR4  
**Test items:** RideController <-> NotificationManager  
**Environmental needs:** N/A  

The NotificationManager, besides having many different "ad-hock" and customizable procedures, performs a simple task, which is to forward notification messages among the various subsystems, therefore is of central importance to test its effectiveness in both forwarding notifications for the RideController and sending notifications from the outside world to it.

### Test case CAR5

**Test case identifier:** CAR5  
**Test items:** CarController <-> NotificationManager  
**Environmental needs:** N/A  

For the reasons stated at CAR4 is important to perform the same kind of testing for the interaction between the CarController and the NotificationManager.

### Test case CAR6

**Test case identifier:** CAR6  
**Test items:** CarController -> ViewController  
**Environmental needs:** N/A  

The two components of this test are very loosely interconnected, in fact the CarController directly controls the ViewController just at the beginning of a ride and in other few situations. So the aim of this test case is to check that after the interaction the correct screen is displayed.

+-----------------------+
| rideStart() |
+-----------------------+

+--------------------+-----------------------+
| Input              | Effect                |
+--------------------+-----------------------+
| N/A                | The home screen is shown |
+--------------------+-----------------------+

### Test case CAR7

**Test case identifier:** CAR7  
**Test items:** RideController -> UserIdentification  
**Environmental needs:** N/A  

The interaction between these two components is strictly related to the check-in phase. So it is important to test that the generation and the verification of the QR code are performed correctly for obvious security concerns.

+-------------------------------+
| generateQR() |
+-------------------------------+

+-----------------------------+--------------------------+
| Input                       | Effect |
+-----------------------------+--------------------------+
| N/A                         | a valid QR code is generated |
+-----------------------------+--------------------------+

+-----------------------------------------------+
| checkCode(code) |
+-----------------------------------------------+

+----------------------+-----------------------+
| Input                | Effect |
+----------------------+-----------------------+
| A null parameter     | A NullArgumentExcpetion is raised |
+----------------------+-----------------------+
| An invalid parameter | A InvalidArgumentException is raised |
+----------------------+-----------------------+
| A non matching code  | false is returned |
+----------------------+-----------------------+
| A matching code      | true is returned |
+----------------------+-----------------------+

### Test case CAR8

**Test case identifier:** CAR8  
**Test items:** NavigationController <-> ViewController  
**Environmental needs:** N/A  

NavigationController and ViewController mostly interact in order to achieve a real time navigation on the car screen. In order to check that they behave correctly, the methods responsible for navigation request and for navigation screen update must be tested.

+-----------------------------------+
| navigateTo(destination, mso) |
+-----------------------------------+

+---------------------------------+-------------------------+
| Input                           | Effect |
+---------------------------------+-------------------------+
| An invalid destination          | An InvalidDestinationException is raised |
+---------------------------------+-------------------------+
| A valid destination and true    | MSO destination is calculated and navigation datas are sent back |
+---------------------------------+-------------------------+
| A valid destination and false   | Navigation datas are sent back |
+---------------------------------+-------------------------+

+-----------------+
| putNav(navData) |
+-----------------+

+----------------------+----------------------+
| Input                | Effect               |
+----------------------+----------------------+
| Valid navData        | navScreenData correctly representing the input navData are generated |
+----------------------+----------------------+

+-----------------+
| endNavigation() |
+-----------------+

+-------------------------+-----------------+
| Input                   | Effect          |
+-------------------------+-----------------+
| N/A                     | The message is received and the end navigation screen is shown |
+-------------------------+-----------------+

### Test case CPRES1

**Test case identifier:** CPRES1  
**Test items:** UserIdentification -> ViewController  
**Environmental needs:** N/A  

The interaction between these two components is carried out during the check-in phase and is mainly focused on showing the generated QR code on screen. Therefore is important to test that the code generated by the system is correctly displayed.

+------------+
| showQR(QR) |
+------------+

+-------------------+-------------------+
| Input             | Effect            |
+-------------------+-------------------+
| A valid QR code   | The QR code is correctly displayed on the car screen |
+-------------------+-------------------+

+-------------+
| checkInOK() |
+-------------+

+----------------+-------------+
| Input          | Effect |
+----------------+-------------+
| N/A            | The message is received and the welcome screen is shown on car display |
+----------------+-------------+

### Test case CPRES2

**Test case identifier:** CPRES2  
**Test items:** ViewController -> GUI  
**Environmental needs:** N/A  

The interaction between ViewController and GUI is for pure presentation purposes, meaning that ViewController sends to the GUI the complete data it needs to build and show each screen during the car usage. So this integration test case focuses on assuring that every screen is generated according to the informations supplied by the ViewController.

For simplicity just one example is reported here, as for each method the same approach has to be adopted: if there's any input and it is a legal parameter then the screen shown must match the input data, if there's no input data then the screen shown must be the one requested.

+------------------------------+
| showNavScreen(navScreenData) |
+------------------------------+

+-------------------------------+---------------------------+
| Input                         | Effect |
+-------------------------------+---------------------------+
| Valid navigation screen datas | The navigation screen is shown on the car display |
+-------------------------------+---------------------------+

### Test case CSENS1

**Test case identifier:** CSENS1  
**Test items:** CarController -> SensorsController  
**Environmental needs:** N/A  

The interaction with the SensorsController has the only purpose of retrieving the values of the parameters representing the sensors readings. To this extent is critical to ensure that these parameters are passed properly, to avoid fake positives, and also that the read values are consistent. In the end the test case consists in checking the correctness of the value retrieval for every physical sensor.

### Test case CSENS2

**Test case identifier:** CSENS2  
**Test items:** CarController -> GPSManager  
**Environmental needs:** N/A  

As for CSENS1, also in this test case we just want to ensure the consistency of the readings from one of the car sensors, the GPS, which has a dedicated manager.

+------------------+
| getGpsPosition() |
+------------------+

+---------------+-------------------+
| Input         | Effect |
+---------------+-------------------+
| N/A           | Returns the right coordinates representing the car's position |
+---------------+-------------------+

### Test case CSENS3

**Test case identifier:** CSENS3  
**Test items:** NavigationController -> GPSManager  
**Environmental needs:** N/A  

This test case is aimed to assure the correctness of the GPS position readings in the same way as in CSENS2 but with the NavigationController as value retriever.

### Test case DATA1

**Test case identifier:** DATA1  
**Test items:** DataAccessManager -> Model  
**Environmental needs:** A populated database  

This test case is aimed to cover all the procedures the DataAccessManager uses to manipulate the Model. Stated that those procedures can be basically decomposed into: creation of new entities, modification of existing ones (i.e. values update), and in rare cases elimination of entities; is critical to assure that any of these actions is performed correctly, so that after the operation the Model contains the expected elements. Id also important to make sure that none of the manipulations leaves the Model in an inconsistent state.

### Test case DA1

**Test case identifier:** DA1  
**Test items:** CarsManager -> DataAccessManager  
**Environmental needs:** N/A  

Here the purpose of the test is to assure that the CarsManager correctly retrieves informations about the cars from the DataAccessManager and that is able to update them. Down are reported two tables of expected test outcomes for two methods belonging each to one of the previous families.

---------------------------
 changeStatus(Car, String)
---------------------------

+--------------------------+---------------+
| Input                    | Effect             |
+==========================+===============+
| Invalid Car              | An InvalidCarExcpetion is raised |
+--------------------------+---------------+
| Invalid State            | An InvalidStateException is raised |
+--------------------------+--------------+
| Both Car and State valid | The selected car state is updated to the chosen one |
+--------------------------+--------------+

---------------------------
 getInfo(Car)
---------------------------

+-----------------------------------+------------------------+
| Input                             | Effect |
+===================================+========================+
| Invalid Car                       | An InvalidCarExcpetion is raised |
+-----------------------------------+------------------------+
| Valid Car                         | A grouped view of informations about the chosen car is returned |
+-----------------------------------+------------------------+

### Test case DA2

**Test case identifier:** DA2   
**Test items:** RidesManager -> DataAccessManager  
**Environmental needs:** N/A  

This test case must ensure that the RidesManager can properly access to informations about all rides and update them, maintaining consistency among operations. The methods are actually similar to the ones in DA1.

---------------------------
 changeStatus(Ride, String)
---------------------------

+----------------------------------------------------+--------+
| Input                                              | Effect             |
+====================================================+========+
| Invalid Ride                                       | An InvalidCarExcpetion is raised |
+----------------------------------------------------+--------+
| Invalid State                                      | An InvalidStateException is raised |
+----------------------------------------------------+--------+
|Both Ride and State valid                           | The selected ride state is updated to the chosen one |
+----------------------------------------------------+--------+
|Valid Ride and State but selected ride is completed | An InvalidOperationException is raised |
+----------------------------------------------------+--------+

---------------------------
 getInfo(Ride)
---------------------------

+-----------------------------------+------------------------+
| Input                             | Effect |
+===================================+========================+
| Invalid Ride                      | An InvalidRideException is raised |
+-----------------------------------+------------------------+
| Valid Ride                        | A grouped view of informations about the chosen ride is returned |
+-----------------------------------+------------------------+

### Test case DA3

**Test case identifier:** DA3  
**Test items:** LoginManager -> DataAccessManager  
**Environmental needs:** N/A  

The LoginManager must be able to correctly retrieve, update and create users informations, all this in a secure  and consistent way, to avoid account violations. Since methods of the type "retrieve" and "update" are shown in DA1 and DA2, here are shown the expected outcomes for the creation of a new user, for the control of ID-password matching and for the assignment of a token to a user.

-----------------------------
createUser(email, password, license)
-----------------------------

+-------------------------------------+------------------------+
| Input                               | Effect |
+=====================================+========================+
| Invalid email address               | An InvalidEmailException is raised |
+-------------------------------------+------------------------+
| Valid but already assigned email    | An ExistingEmailException is raised |
+-------------------------------------+------------------------+
| Invalid license                     | An InvalidLicenseException is raised |
+-------------------------------------+------------------------+
| Valid but already assigned license  | An ExistingLicenseException is raised |
+-------------------------------------+------------------------+
| Valid email and license             | A new user with the corresponding informations is created |
+-------------------------------------+------------------------+

--------------------
checkLoginParam(ID, password)
--------------------

+--------------------------------------+-----------------------+
| Input                                | Effect |
+======================================+=======================+
| Not existing ID                      | A NotExistingIDException is raised |
+--------------------------------------+-----------------------+
| Not matching ID and password         | false is returned |
+--------------------------------------+-----------------------+
| Matching ID and password             | true is returned  |
+--------------------------------------+-----------------------+

----------------
assignToken(ID, token)
----------------

+--------------------------------------+-----------------------+
| Input                                | Effect |
+======================================+=======================+
| Not existing ID                      | A NotExistingIDException is raised |
+--------------------------------------+-----------------------+
| Valid ID                             | The token is assigned to the selected user and the model updated |
+--------------------------------------+-----------------------+

### Test case DA4

**Test case identifier:** DA4  
**Test items:** BookingsManager -> DataAccessManager  
**Environmental needs:** N/A  

As in the other tests of this "set" it is important to make sure that the BookingsManager is able to correctly and consistently manipulate data concerning its duties. Is therefore tested the functioning of procedures made to create, update and check on bookings.

----------------
completeBooking(ID)
----------------

+--------------------------+---------------------------+
| Input                    | Effect |
+==========================+===========================+
| Not existing ID          | A NotExistingIDException is raised|
+--------------------------+---------------------------+
| ID of completed booking  | An InvalidOperationException is raised |
+--------------------------+---------------------------+
| Valid ID                 | The selected booking is marked as completed |
+--------------------------+---------------------------+

---------------
checkFree(Car)
---------------

+---------------------------------+-----------------------+
| Input                           | Effect |
+=================================+=======================+
| Invalid Car                     | An InvalidCarExcpetion is raised |
+---------------------------------+-----------------------+
| A Car which state is not Free   | false is returned     |
+---------------------------------+-----------------------+
| A Car which state is Free       | true is returned      |
+---------------------------------+-----------------------+

-----------------
newBooking(BookingData)
-----------------

+-----------------------------------+-------------------------+
| Input                             | Effect |
+===================================+=========================+
| Invalid BookingData               | An InvalidBookingDataException is raised |
+-----------------------------------+-------------------------+
| Valid BookingData                 | A Booking matching the informations contained in the BookingData is created |
+-----------------------------------+-------------------------+

### Test case DA5

**Test case identifier:** DA5  
**Test items:** CarAssistanceManager -> DataAccessManager  
**Environmental needs:** N/A  

This test case is aimed to assure that the CarAssistanceManager is able to access data about the cars, here the focus is only about correct retrieval since the CarAssistanceManager doesn't directly modify cars status. The methods for data retrieval must be tested for correctness as in the analogous cases showed previously.

### Test case DA6

**Test case identifier:** DA6  
**Test items:** Configurator -> DataAccessManager  
**Environmental needs:** N/A  

The Configurator's purpose is to modify parameters concerning the service terms and boundaries, which consists in managing Fares, PriceVariations and Boundaries, therefore this test case is aimed to ensure that the Configurator creates, modifies and deletes those elements in the expected way and that no operation can lead to an inconsistent state.

### Test case DA7

**Test case identifier:** DA7  
**Test items:** StationController -> DataAccessManager  
**Environmental needs:** N/A  

The StationController is a simple component with the only purpose of updating the number of plugs available in each station, so this test case must make sure that the values are updated correctly and that no operation leads to inconsistent states in the Model.
