abstract sig Bool{}
one sig True extends Bool{}
one sig False extends Bool{}

abstract sig CarState{}
one sig Available extends CarState{}
one sig Busy extends CarState{}
one sig UnderMaintenance extends CarState{}

abstract sig BatteryLevel{}
one sig LowL extends BatteryLevel{}
one sig MedL extends BatteryLevel{}
one sig OkL extends BatteryLevel{}

abstract sig Position{}
sig SafeP extends Position{}
sig UnsafeP extends Position{}
sig OutsideCity extends UnsafeP{}
sig RechargeArea extends SafeP{} //

abstract sig AssistanceType{}
one sig Move extends AssistanceType{}
one sig Recharge extends AssistanceType{}
one sig Repair extends AssistanceType{}

abstract sig PriceVariation {}
one sig BonusHighBatt extends PriceVariation {}
one sig BonusPassenger extends PriceVariation {}
one sig BonusRecharge extends PriceVariation {}
one sig MalusLowBatt extends PriceVariation {}

sig Car{

	battery: one BatteryLevel,
	flagged: one Bool,
	mechProbSensor: one Bool, // True if there is a mechanical problem
	status: one CarState,
	plugged: one Bool,
	position: one Position

}

sig User{

	riding: lone Car

}


sig Operator{}

sig AssistanceRequest{

	supervisor: one Operator,
	type: one AssistanceType,
	car: one Car

}

//timecode is used to simplify the model with the following meaning:
//if 2 rides has different timecodes means that they have took place
//in two disjoint period of time
sig Ride{//rapresents only the rides that have ended

	driver: one User,
	passengers: set User,
	vehicle:one Car,
	timecode: one Int,
	price: one Int,
	startP: one Position,
	endP: one Position,
	legal: one Bool,
	endBatteryLevel: one BatteryLevel,
	endWithCharge: one Bool,
	longerThan2: one Bool,
	fare: set PriceVariation,
	paid: one Bool

}{
	price>0
	timecode>=0
	#passengers <= 3
	endWithCharge = True implies (endP in RechargeArea)
}

sig Booking{
	client: one User,
	car: one Car
}


//FACTS

//AssistantRequest facts


//A car under assistance must be in the UnderMaintenanceState
fact maintenanceState{

	all a: AssistanceRequest | let c=a.car | c.status=UnderMaintenance

}

fact assistanceTypePolicy{ //problems has a priority: Repair>Move>Recharge

	all a: AssistanceRequest | let c=a.car |
	((c.mechProbSensor=True iff a.type=Repair)
	&&
	(a.type=Recharge implies (c.battery=LowL && c.plugged=False && c.position in SafeP))
	&&
	(a.type=Move implies c.position not in SafeP))

}

//only an assistance request for a car at a time
fact onlyOneARforACar{
		all disj a1,a2: AssistanceRequest | a1.car!=a2.car
}

//Booking facts

fact outsidecityNonBookable{
	all b: Booking | (b.car.position not in OutsideCity)
}

fact bookedCarAreBusy{
	all b: Booking | (b.car.status=Busy)
}

fact bookedCarsNotUsed{
	all b: Booking | (b.client not in riding.Car) && (b.car not in User.riding)
}
fact uniqueBooking{
	all disj b1,b2: Booking | b1.client!=b2.client && b1.car!=b2.car
}

//Ride facts

fact bonusAndMalusPolicy{
	all r: Ride |
	 ((r.legal = True  && r.longerThan2=True)
   	 implies
		((r.endWithCharge = True iff BonusRecharge in r.fare)
   		 &&
	 	(r.endBatteryLevel = OkL iff BonusHighBatt in r.fare )
		&&
		(#(r.passengers) >=2 iff BonusPassenger in r.fare)
   		&&
		((r.endBatteryLevel = LowL &&  r.endP not in RechargeArea) iff MalusLowBatt in r.fare)))
	&&
	((r.legal = False or r.longerThan2=False) implies r.fare = none)
}

//clients that haven't paid for a ride are banned
fact ban{
	all disj r1,r2 : Ride |
	(r1.paid=False && r1.driver=r2.driver)
	implies
	(r1.timecode>r2.timecode)
}

fact bannedUserCannotBeRiding{
	all r:Ride | r.paid=False implies r.driver not in riding.Car+Booking.client
}

//users can be only in one ride at a time
fact disjointRides{
	all disj r1,r2:Ride | r1.timecode=r2.timecode
	implies
	 (r1.driver+r1.passengers+r1.vehicle)&(r2.driver+r2.passengers+r2.vehicle)=none
}

fact theDriverIsNotAPassanger{
	all r:Ride | r.driver not in r.passengers
}

// no ride can start outside the city area
fact validStartPosition{
	all r:Ride | r.startP not in OutsideCity
}

//a ride which doesn't end in a safe area is not legal
fact legalEndPosition{
	all r: Ride | r.endP not in SafeP iff r.legal=False
}

//cars can be pluggeg only in a recharging area
fact carsPluggedInRechargeArea{
 	all c : Car | (c.plugged=True implies c.position in RechargeArea)
}

//two cars can't be in the same exact position
fact carsHaveUniquePositions{
	all disj c1,c2: Car | c1.position!=c2.position
}

fact carNotInUseAreNotBusy{
	all c:Car | notInUse[c] implies c.status!=Busy
}

fact notAvaiableOutsideCIty{
	all c:Car | c.position in OutsideCity implies c.status!=Available
}

//cars with a mechanical problems are under maintence if they are not not rided
fact mechProblem{
	all c:Car | c.mechProbSensor=True implies ( c not in User.riding implies c.status=UnderMaintenance)
}

//cars that are being rided are busy
fact busyCar{
	all u:User | u.riding!=none implies u.riding.status=Busy
}

pred notInUse[c: Car]{
	c not in (User.riding + Booking.car +AssistanceRequest.car)
}

//two different users can't ride the same car at the same time
fact onlyOneDriver{
	all disj u1,u2: riding.Car | u1.riding!=u2.riding
}

fact flagPolicy{
	all c: Car|
	(c.mechProbSensor=True
	or
	(c.battery=LowL&&c.plugged=False)
	or
	(c.position not in SafeP && c not in User.riding)
	or
	(c.position in OutsideCity)) iff c.flagged=True
}

//ASSERTIONS

assert carUnderAssistanceNotInUse{
	all c : AssistanceRequest.car | c not in User.riding
}

assert notAvailableCarWithMechProblem{
	all c: Car | c.status=Available implies c.mechProbSensor=False
}

assert noTwoRide{
	all u:User, disj r1,r2:Ride | r1.driver=u&&r2.driver=u implies r1.timecode!=r2.timecode
}

assert busyStatus{
	all c: Car | c.status=Busy implies(c in (Booking.car + User.riding))
}

assert carsAvailable{
	all c: Car | (notInUse[c]&&c.status!=UnderMaintenance) implies c.status=Available
}

assert noPassIsDriver{
	all r:Ride | r.driver not in r.passengers
}

assert bookedCarsHaveNoMechProblems{
	all b:Booking | b.car.mechProbSensor=False
}

//PREDS

// c,c': car before and after the end of the ride
pred usedCar[c,c':Car,r:Ride,u:User]{
	#User=1
	#Car=2
	#Ride=1
	#Booking=0
	#Operator=0
	#AssistanceRequest=0
	c.position not in OutsideCity
	c.mechProbSensor=False
	c!=c'
	(c.battery=LowL implies c'.battery=LowL)
	(c.battery=MedL implies c'.battery!=OkL)
	r.endWithCharge=True iff c'.plugged=True
	r.vehicle=c'
	r.endBatteryLevel=c'.battery
	r.endP=c'.position
	r.driver=u
	u.riding=c
	r.legal=True
	c.battery!=c'.battery
	Position in (Car.position +Ride.startP+Ride.endP)
}

// c,c': car before and after being booked
pred bookedCar[c,c':Car,b:Booking,u,u':User]{
	#User=2
	#Car=2
	#Booking=1
	#AssistanceRequest=0
	#Operator=0
	#Ride=0
	c.status=Available
	u not in riding.Car
	u not in Booking.client
	//we can't state that they are in the same Position
	c.position in RechargeArea iff c'.position in RechargeArea
	c.position in SafeP iff c'.position in SafeP
	c.position in UnsafeP iff c'.position in UnsafeP
	c.position in OutsideCity iff c'.position in OutsideCity
	b.client=u'
	b.car=c'
	Position in (Car.position +Ride.startP+Ride.endP)
}

// c,c',c'': care before, during and after the assistance
pred assistanceGiven[c,c',c'':Car]{
	#User=0
	#Car=3
	#Booking=0
	#AssistanceRequest=1
	#Operator=1
	#Ride=0
	c not in AssistanceRequest.car
	c.flagged=True
	c.battery=c'.battery
	c.status!=Busy
	c.plugged=c'.plugged
	c.mechProbSensor=c'.mechProbSensor
	c' in AssistanceRequest.car
	c''.status=Available
	c''.flagged=False
	c''.battery=OkL
	//we can't state that they are in the same Position
	c.position in RechargeArea iff c'.position in RechargeArea
	c.position in SafeP iff c'.position in SafeP
	c.position in UnsafeP iff c'.position in UnsafeP
	c.position in OutsideCity iff c'.position in OutsideCity
	Position in (Car.position +Ride.startP+Ride.endP)
}

pred showRides{
	#Ride=3
	#riding=0
	#Booking=0
	#AssistanceRequest=0
	#Car=3
	#User=3
	Position in (Car.position +Ride.startP+Ride.endP)
	#RechargeArea>1
	some r: Ride | #(r.fare-MalusLowBatt)=3
}

pred showRidingAndBookings{
	#Ride=0
	#Booking=3
	#riding>0
	#Car=5
	#riding>0
	#AssistanceRequest=0
	Position in (Car.position +Ride.startP+Ride.endP)
}

pred showAssistance{
	#Ride=0
	#User=0
	#Car=5
	#AssistanceRequest=4
	#Operator=3
	Position in (Car.position +Ride.startP+Ride.endP)
}

pred show{
	#Ride=3
	#Booking=0
	#Car=4
	#User=5
	Position in (Car.position +Ride.startP+Ride.endP)
}

//Run commands

run assistanceGiven for 10
run bookedCar for 10
run usedCar for 10
run showAssistance for 10
run showRidingAndBookings for 10
run showRides for 10
run show for 10
check notAvailableCarWithMechProblem
check noTwoRide
check carUnderAssistanceNotInUse
check busyStatus
check carsAvailable
check noPassIsDriver
check bookedCarsHaveNoMechProblems
