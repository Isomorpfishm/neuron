TITLE Calcium T channel for Subthalamic Nucleus

UNITS {
	(mV) = (millivolt)
	(mA) = (milliamp)
}

NEURON {
	// Access to all variables in this mechanism from the hoc file is done using the SUFFIX.
	SUFFIX CaT
	
	// USEION specifies what ions this channel mechanism uses.
	// READ lists ionic variables needed in calculating the ionic channel current.
	// WRITE lists what ionic variables are calculated in this mechanism (usually the current).
	USEION ca READ eca WRITE ica
	
	// RANGE makes the following variables visible to the NEURON interpreter and 
	// specifies that they are be functions of position,
	// e.g., the maximum channel conductance should be a RANGE variable,
	// since it can be different at different points on a neuron.
	RANGE gmax
}


// The PARAMETER block specifies variables that:
// 1. are not changed as a result of the calculations in the mechanisms;
// 2. are (generally) constant throughout time; and
// 3. can be changed by the user from the hoc interface or the GUI.

PARAMETER {
	gmax = 0.002 (mho/cm2)
}


// The ASSIGNED block declares variables that are either:
// 1. calculated by the mechanism itself or
// 2. computed by NEURON.

ASSIGNED {
	v       (mV)
	eca		(mV)
	ica		(mA/cm2)
	ralpha	(/ms)
	rbeta	(/ms)
	salpha	(/ms)
	sbeta	(/ms)
	dalpha	(/ms)
	dbeta	(/ms)
}


// The STATE block declares state variables.
// One type of state variable are the variables that we are trying to solve for in kinetic schemes.

STATE {
	r s d
}


// The BREAKPOINT is the top level mechanism calculation block that simply solves the differential equations and calculates the Ca current

BREAKPOINT {
	// The SOLVE statement refers to the `states` defined in our DERIVATIVE block.
	// The METHOD `cnexp` part tells NEURON to use the 'cnexp' method of integration. 
	SOLVE states METHOD cnexp
	ica = gmax*r*r*r*s*(v-eca)
}


// The INITIAL block is used to set the state variables `r`, `d` and `s` to their initial values.
// Usually these are the values of the state variables at equilibrium.
// The INITIAL block first calls the procedure `settables` with the present voltage to calculate the values of the alpha and beta functions.
// These, in turn, are used to calculate the initial state variables.

INITIAL {
	settables(v)
	r = ralpha/(ralpha+rbeta)
	s = (salpha*(dbeta+dalpha) - (salpha*dbeta))/((salpha+sbeta)*(dalpha+dbeta)-(salpha*dbeta))
	d = (dbeta*(salpha+sbeta)-(salpha*dbeta))/((salpha+sbeta)*(dalpha+dbeta)-(salpha*dbeta))
}


// Specify the differential equations using the DERIVATIVE block.
// Each tie NEURON calculates the differential eqns, the alpha and beta variables must be updated,
// so the first line calls our procedure `settables` with the current voltage `v`. 
// Then each differential eqn is specified.

DERIVATIVE states {
	settables(v)
	r' = ((ralpha*(1-r)) - (rbeta*r))
	d' = ((dbeta*(1-s-d)) - (dalpha*d))
	s' = ((salpha*(1-s-d)) - (sbeta*s))
}

UNITSOFF


// The PROCEDURE block allows us to calculate the equations at any tie by simply using our defined procedure.
// In our case, we need a procedure that takes the current voltage `v` and calculates values of the variables `ralpha`, `rbeta`, etc.
// We will call out procedure `settables`.
// To calculate all the alpha and beta functions we simply call the procedure `settables`.
// As these functions will need to be re-evaluated at each time step (as the voltage is changing), 
// it is more computationally efficient to create a table of values calculated at closely spaced voltagess at the start of a simulation,
// and use table lookup with linear interpolation based on the current voltage.
// This can be done by adding a TABLE line to the procedure.

PROCEDURE settables(v (mV)) {
	LOCAL bd
	TABLE ralpha, rbeta, salpha, sbeta, dalpha, dbeta FROM -100 TO 100 WITH 200

	ralpha = 1.0/(1.7+exp(-(v+28.2)/13.5))
	rbeta = exp(-(v+63.0)/7.8)/(exp(-(v+28.8)/13.1)+1.7)

	salpha = exp(-(v+160.3)/17.8)
	sbeta = (sqrt(0.25+exp((v+83.5)/6.3))-0.5) * (exp(-(v+160.3)/17.8))

	bd = sqrt(0.25+exp((v+83.5)/6.3))
	dalpha = (1.0+exp((v+37.4)/30.0))/(240.0*(0.5+bd))
	dbeta = (bd-0.5)*dalpha
}

UNITSON
