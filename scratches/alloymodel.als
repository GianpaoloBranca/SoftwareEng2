abstract sig Bool{}
one sig True extends Bool{}
one sig False extends Bool{}

abstract sig CarState{}
one sig Available extends CarState{}
one sig Busy extends CarState{}
one sig UnderMaintance extends CarState{}

abstract sig BLevel{}
one sig LowL extends BLevel{}
one sig OkL extends BLevel{}

abstract sig Position{}
sig SafeP extends Position{}
sig UnsafeP extends Position{}
sig OutsideCity extends UnsafeP{}
sig RechArea extends SafeP{}

abstract sig AType{}
one sig Move extends AType{}
one sig Recharge extends AType{}
one sig Repair extends AType{}
 

sig Car{

	battery: one BLevel,
	flagged: one Bool,
	mechProbSensor: one Bool,
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
	type: one AType,
	car: one Car

}

//timecode is used to simplify the model with the following meaning:
//if 2 rides has different timecodes means that they have took place 
//in two disjoint period of time
sig Ride{

	driver: one User,
	passengers: set User,
	vehicle:one Car,
	timecode: one Int,
	price: one Int,
	startP: one Position,
	endP: one Position,
	legal: one Bool

}{
	(price>0)&&(#passengers<=3)
}

sig Booking{
	client: one User,
	car: one Car
}


//FACTS

//AssistantRequest facts


//A car under assistance must be in the UndermaintanceState
fact maintananceState{

	all a: AssistanceRequest | let c=a.car | c.status=UnderMaintance

}

fact typePolicy{

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
fact carsPluggedInRechArea{
 	all c : Car | (c.plugged=True implies c.position in RechArea)
}

//two cars can't be in the same exact position
fact carsHaveUniquePositions{
	all disj c1,c2: Car | c1.position!=c2.position
}

fact carNotInUseAreNotBusy{
	all c:Car | notInUse[c] implies c.status!=Busy
}

//cars with a mechanical problems are put under maintence if they not busy
fact mechProblem{
	all c:Car | c.mechProbSensor=True => ( c not in User.riding => c.status=UnderMaintance)
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
	all c: Car | (notInUse[c]&&c.status!=UnderMaintance) implies c.status=Available
}

assert noPassisDriver{
	all r:Ride | r.driver not in r.passengers
}

//PREDS

pred showRides{
	#Ride=2
	#riding=0
	#Booking=0
	#AssistanceRequest=0
	#Car=3
	#User=3
	Position in (Car.position +Ride.startP+Ride.endP)
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

run showAssistance for 10
run showRidingAndBookings for 10
run showRides for 10
run show for 10 
check notAvailableCarWithMechProblem
check noTwoRide
check carUnderAssistanceNotInUse
check busyStatus
check carsAvailable
check noPassisDriver

