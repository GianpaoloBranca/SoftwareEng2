### Test case CS
__Identifier:__ CS1  
__Items:__ Car System -> PWEService  
__Description:__  

---

__Identifier:__ CS2  
__Items:__ PWEService -> CarSystem  
__Description:__

####Unlock()
+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| nothing             | the car is unlocked. If already unlocked, a warning is logged |
+---------------------+-------------------------------+


### Test case MS
__Items:__ MonitoringWebApp -> PWEService  
__Description:__



### Test case AS
__Items:__ MobileApp -> PWEService  
__Description:__  

 In every function that require a token, if it is expired or invalid an error is displayed, the user get logged out and the login screen is displayed. In every function with effect "INVALID BEHAVIOR" the action is not performed and an error is displayed in the app. The action is logged and reported, since it should never be possible to perform from the mobile App.

####Login(ID, password)
+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| invalid ID          | user can not proceed and an   |
| or invalid password | error message with "invalid   |
|                     | user name or password" is     |
|                     | displayed in the app.         |
+---------------------+-------------------------------+
| valid ID            | the main screen is displayed  |
| and password        | in the application, a token   |
|                     | is assigned to the user and   |
|                     | the action is logged.         |
+---------------------+-------------------------------+


####SearchCar(position, radius)
+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| invalid position    | user can not proceed and an   |
|                     | error message with "invalid   |
|                     | position" is                  |
|                     | displayed in the app.         |
+---------------------+-------------------------------+
| valid position      | the map show all the car available in the specified range. If the range is equal to 0  it means that it is unlimited. If no cars are available in the range, a warning message is displayed       |
+---------------------+-------------------------------+


####Book(carID, token)
+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| Not available Car   | an error is displayed and no actions are performed
+---------------------+-------------------------------+
| Available Car       | the car is no more available, the booking is created in the DB, the mobile app display the newly created booking


####Unlock(bookingID, token)
+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| booking not         | INVALID BEHAVIOR
| performed by the    |  
| user or in an       |
| invalid status
+---------------------+-------------------------------+
| valid booking       | the car is unlocked and the booking status updated |

####CheckIn(code, bookingID, token)
+---------------------+-------------------------------+
| __Input__           | __Effect__                    |
+---------------------+-------------------------------+
| non matching code   | an error is displayed
+---------------------+-------------------------------+
| booking in the      | INVALID BEHAVIOR
| wrong status        |
+---------------------+-------------------------------+
| matching code       | the user check-in in the car and the booking status is updated
+---------------------+-------------------------------+
