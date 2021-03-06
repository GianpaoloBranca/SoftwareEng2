## 3.2 Subsystem integration sequence

In this section we explain in details the desired behavior of the components when they are integrated. Main or more critical functions are described in tables with further details.  

In every function with effect "INVALID BEHAVIOR" the action is not performed and an error is displayed. The action is logged and reported, since it should never be possible to perform. Every function that might have an invalid ID, if not specified differently, is is threaten as INVALID BEHAVIOR.

### Test case CS
__Items:__ CarSystem <--> PWEService  
__Description:__ These components are the core of the system and communicates often. We have to pay particular attention to the cars and tests them in many situations. We of course have less control over the cars than on the main server when the system go online.

####PWEService.NotifyRideData(rideData)
+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| Invalid or corrupted| The car is asked to send the information again. If the datas are not correct the third time, the car goes in maintenance status and the engine is switched off. The user is only charged by 1�.
| datas
+---------------------+-------------------------------+
| Valid datas         | The user is charged the right fare and the Ride ends.

---

####CarSystem.CheckIn(code, UserID)

+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| Invalid code        | An error is returned. Nothing happens on the display. |
+---------------------+-------------------------------+
| Valid code          | The engine is unlocked, a new Ride is created by the car system. The first user who checkin is registered as driver.

----

### Test case MS

__Items:__ MonitoringWebApp -> PWEService  
__Description:__ We do not expect particular difficulties in this phase, since MonitoringWebApp provide only a way to display datas of the services and sometimes modifies them. The assistance requests are weakly connected with the other components. The integration does not involve the main services.

####CarOverview(CarID)

+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| Invalid CarID       | An error is displayed.         |
+---------------------+-------------------------------+
| Valid CarID         | The screen with the detailed car information is displayed.

####RequestAssistance(filledForm)

+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| Invalid filledForm  | INVALID BEHAVIOR              |
+---------------------+-------------------------------+
| Valid filledForm    | A message of success is displayed and the request is correctly sent. |

---

### Test case AS

__Items:__ MobileApp -> PWEService  
__Description:__ This integration test is crucial since it involves what will be delivered to the final user, and it is the last step of the whole integration process.

 In every function that require a token, if it is expired or invalid an error is displayed, the user get logged out and the login screen is displayed.

####Login(ID, password)

+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| Invalid ID          | User can not proceed and an   |
| or invalid password | error message with "invalid   |
|                     | user name or password" is     |
|                     | displayed in the app.         |
+---------------------+-------------------------------+
| Valid ID            | The main screen is displayed  |
| and password        | in the application, a token   |
|                     | is assigned to the user and   |
|                     | the action is logged.         |
+---------------------+-------------------------------+


####SearchCar(position, radius)

+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| Invalid position    | User can not proceed and an   |
|                     | error message with "invalid   |
|                     | position" is                  |
|                     | displayed in the app.         |
+---------------------+-------------------------------+
| Valid position      | The map show all the car available in the specified range. If the range is equal to 0  it means that it is unlimited. If no cars are available in the range, a warning message is displayed.       |
+---------------------+-------------------------------+


####Book(carID, token)

+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| Not available Car   | An error is displayed.
+---------------------+-------------------------------+
| Available Car       | The car is no more available, the booking is created in the DB, the mobile app display the newly created booking.


####Unlock(bookingID, token)

+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| Booking not         | INVALID BEHAVIOR
| performed by the    |  
| user or in an       |
| invalid status
+---------------------+-------------------------------+
| Valid booking       | The car is unlocked and the booking status updated. |

####CheckIn(code, token)

+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| Non matching code   | An error is displayed.
+---------------------+-------------------------------+
| Matching code       | The user check-in in the car and the booking status is updated.
+---------------------+-------------------------------+
