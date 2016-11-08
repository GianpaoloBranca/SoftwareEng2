
//CLASSES

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
}{
	(position in UnsafeP and status!=Busy) implies flagged=True	
	position in OutsideCity implies flagged=True
}

sig User{
	riding: lone Car 
}

fact{
	all u:User | u.riding!=none implies u.riding.status=Busy 
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

fact assistanceRequestProperties{
	//A car under assistance must have be in the UndermaintanceState
	all a: AssistanceRequest | let c=a.car |( c.status=UnderMaintance
	//fatcs that determinate assistance type
	&& (c.mechProbSensor=True <=> a.type=Repair)
	&& (a.type=Recharge=>(c.battery=LowL && c.plugged=False && c.position in SafeP))
	&& (a.type=Move=> c.position not in SafeP))
	//only an assistance request for a car at a time
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

fact rideProperties{
	//users can be only in one ride at a time
	all disj r1,r2:Ride | r1.timecode=r2.timecode implies (r1.driver+r1.passengers+r1.vehicle)&(r2.driver+r2.passengers+r2.vehicle)=none
	// driver not in passengers
	all r:Ride | r.driver not in r.passengers
}

// no ride can start outside the city area
fact validStartPosition{
	all r:Ride | r.startP not in OutsideCity
}

//a ride which doesn't end in a safe area is not legal
fact legalEndPosition{
	all r: Ride | r.endP not in SafeP <=> r.legal=False
}

fact carsPluggedInRechArea{
 	all c : Car | (c.plugged=True implies c.position in RechArea)
}

fact carHaveUniquePosition{
	all disj c1,c2: Car | c1.position!=c2.position
}

fact carNotInUseAreNotBusy{
	all c:Car | notInUse[c] implies c.status!=Busy
}

//cars with a mechanical problems are put under maintence if they not busy
fact mechProblem{
	all c:Car | c.mechProbSensor=True => ( c not in User.riding => c.status=UnderMaintance)
}

pred notInUse[c: Car]{
	c not in (User.riding + Booking.car +AssistanceRequest.car)
}

fact onlyOneDriver{
	all disj u1,u2: riding.Car | u1.riding!=u2.riding
}

fact flagPolicy{
	all c: Car| (c.mechProbSensor=True or (c.battery=LowL&&c.plugged=False) or c.position not in SafeP) <=> c.flagged=True
}

//ASSERTIONS

assert carUnderAssistanceNotInUse{
	all c : AssistanceRequest.car | c not in User.riding
}

assert notAvailableCarWithMechProblem{
	all c: Car | c.status=Available => c.mechProbSensor=False
}

assert noTwoRide{
	all u:User, disj r1,r2:Ride | r1.driver=u&&r2.driver=u implies r1.timecode!=r2.timecode 
}

assert busyStatus{
	all c: Car | c.status=Busy =>(c in (Booking.car + User.riding))
}

assert carsAvailable{
	all c: Car | (notInUse[c]&&c.status!=UnderMaintance) implies c.status=Available
}

assert noPassisDriver{
	all r:Ride | r.driver not in r.passengers
}

fact{#Booking>1} // testing purpose

//PREDS
pred show{

}
run show for 10 
check notAvailableCarWithMechProblem 
check noTwoRide
check carUnderAssistanceNotInUse
check busyStatus
check carsAvailable
check noPassisDriver

