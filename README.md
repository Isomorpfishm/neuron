# Modelling of an in vitro Neuromodulatory Co-culture System

This project is implemented using the [NEURON simulation environment][1] version 8.0 on Windows.

[1]: https://www.neuron.yale.edu/neuron/

*Update (June 23, 2021):*
* Inserted `Gfluct.mod` NMODL mechanism to the axon of all 12 neurons in the system. 
* The IClamp point process was limited at the axon of the first neuron in the first node and spiked only once at the beginning of the simulation.
* Number of internodal and internodal synapses were decreased to 20 each and the possibilities for zero weight (no connection) were considered.
* For the intranodel synapses, the number of synapses for even permutations of connection (0 -> 1 -> 2) and odd permutations of connection (1 -> 0 -> 2) was restricted to a maximum of 10 each with randomness applied. Therefore, there would be a maximum of 20 synapses when all 10 odd and even permutations of connection were present, respectively. 
* Increased randomness for the synaptic transmisson delay (1-5 ms) and the weight (0-1) using uniform distribution. 
* Synaptic transmission voltage threshold increased to -55 mV.
