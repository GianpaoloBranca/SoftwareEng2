####Test Case C1
__Test case identifier:__ C1T1  
__Test items:__ NavigationController -> GPSManager  
__Input Specification:__  Create typical NavigationController requests  
__Output Specification:__ Check if the correct functions are called and returns the correct position  
__Environmental Needs:__ N/A

__Test case identifier:__ C1T2  
__Test items:__ CarController -> GPSManager  
__Input Specification:__  Create typical CarController input  
__Output Specification:__ Check if the correct functions are called and returns the correct position  
__Environmental Needs:__ N/A

----

#### Test Case C2
__Test case identifier:__ C2T1  
__Test items:__ CarController -> SensorsController  
__Input Specification:__  Create typical CarController input  
__Output Specification:__ Check if the correct functions are called and returns the correct datas  
__Environmental Needs:__ N/A

----

#### Test Case C3
__Test case identifier:__ C3T1  
__Test items:__ CarController -> CarStatus  
__Input Specification:__  Create typical CarController input  
__Output Specification:__ Check if the correct functions are called and the CarStatus is consistent  
__Environmental Needs:__ C2 succeeded

----

#### Test Case C4
__Test case identifier:__ C4T1  
__Test items:__ ViewController -> GUI  
__Input Specification:__  Create typical ViewController input  
__Output Specification:__ Check if the correct functions are called and the informations are properly displayed  
__Environmental Needs:__ N/A

----

#### Test Case C5
__Test case identifier:__ C5T1  
__Test items:__ NavigationController -> ViewController  
__Input Specification:__  Create typical NavigationController input  
__Output Specification:__ Check if the correct functions are called
__Environmental Needs:__ C4 Succeeded

__Test case identifier:__ C5T2  
__Test items:__ CarController -> ViewController  
__Input Specification:__  Create typical CarController input  
__Output Specification:__ Check if the correct functions are called
__Environmental Needs:__ C4 Succeeded

__Test case identifier:__ C5T3  
__Test items:__ UserIdentification -> ViewController  
__Input Specification:__  Create typical UserIdentification input  
__Output Specification:__ Check if the correct functions are called
__Environmental Needs:__ C4 Succeeded, CarAppServer available

----

#### Test Case C6
__Test case identifier:__ C6T1  
__Test items:__  RideController -> UserIdentification  
__Input Specification:__  Create typical RideController input  
__Output Specification:__ Check if the correct functions are called
__Environmental Needs:__ N/A

----

#### Test Case C7
__Test case identifier:__ C7T1  
__Test items:__  RideController -> NavigationController
__Input Specification:__  Create typical RideController input  
__Output Specification:__ Check if the correct functions are called
__Environmental Needs:__
