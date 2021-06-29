# Modelling of an in vitro Neuromodulatory Co-culture System

This project is implemented using the [NEURON simulation environment][1] version 8.0 on Windows. All of NMODL mechanism files are included in the **_task_** folder in this repository.

[1]: https://www.neuron.yale.edu/neuron/


**Update (June 28, 2021) on `task3-2.hoc`:**
* Inserted `tmgsyn.mod` which simulates short-term (excitatory) synaptic plasticity to the axon of all 12 neurons in the system. 
* Inserted `ipulse1.mod` which includes current clamps (point processes) that deliver a sequence of current pulses at regular intervals.
* Removed the single pulse current clamps.
* Optimisation on generating the intranodal and internodal synapses.
* Hodgkin–Huxley model in all compartments were restored to default values.
* Composed a script named `find_signal_peaks.py` to find the peaks of the neuronal transmission voltage.


**Update (June 23, 2021) on `task3-1.hoc`:**
* Inserted `Gfluct.mod` NMODL mechanism to the axon of all 12 neurons in the system. 
* The IClamp point process was limited at the axon of the first neuron in the first node and spiked only once at the beginning of the simulation.
* Number of internodal and internodal synapses were decreased to 20 each and the possibilities for zero weight (no connection) were considered.
* For the intranodel synapses, the number of synapses for even permutations of connection (0 -> 1 -> 2) and odd permutations of connection (1 -> 0 -> 2) was restricted to a maximum of 10 each with randomness applied. Therefore, there would be a maximum of 20 synapses when all 10 odd and even permutations of connection were present, respectively. 
* Increased randomness for the synaptic transmisson delay (1-5 ms) and the weight (0-1) using the uniform distribution. 
* Synaptic transmission voltage threshold increased to -55 mV from -65 mV.
* Modified the number of segments of the neurons' compartments.
