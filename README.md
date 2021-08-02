# Modelling of an *in vitro* Neuromodulatory Co-culture System

This project is implemented using the [NEURON simulation environment][1] version 8.0 on Windows. All of NMODL mechanism files are included in the **_mechanism_** folder while the raster plots which represent neural events are included in the **_raster_plot_** folder in this repository.

[1]: https://www.neuron.yale.edu/neuron/

**Please contact the author on the simulation results, if needed.**


**Update (July 31, 2021) on `task3-3.hoc`:**
* Modified the `.hoc` code so that it is able to export voltages measured at the axon (normalised distance of 0.25 from the distal end) of all 12 neurons automatically.
* To mimic the *in vitro* experimental data, the standard deviation and the time constant of excitatory conductance were restored to their default values.
* Compatible with session file `task3-3.ses`.

**Update (July 27, 2021) on `task3-3.hoc`:**
* Corrected the errors of producing and classifying intranodal synapses.
* Saved `Gfluct.mod` random values, intranodal and internodal synaptic weights, and their respective quantities into separated files.
* Defined `multi_run()` procedure which automated the `run()` and data exportation processes.
* Composed `seed_generator.py` which uses `random.randrange(sys.maxsize)` to export a `seed.dat` file which is comprised of 1000 randomly generated values to compensate the default *pseudo-randomess* of `.hoc` code. Afterwards, `task3-3.hoc` will scan `seed.dat` and take an integer as seed value.
* The seed value taken will affect the number of synapses, weights, and the `normrand()` function in `Gfluct.mod`.

**Update (July 22, 2021) on `task3-2.hoc`:**
* All `Gfluct.mod` parameters relating to inhibitory synapses in the `.hoc` file were set to zero.
* Reduced the standard deviation of the exhibitory conductance `std_e` in order to obtain results which reflected *in vitro* simulations more realistically.
* The train of spikes were reduced from 100 to 5.
* Modified the mechanism file `Gfluct.mod` in order to record the random numbers generated from further analysis purposes.
* Tuning the facilitation variable `U`.
* Analysing the unrealistic burst in continuous current spikes. 

**Update (July 17, 2021) on `task4-1.ipynb`:**
* Created a Jupyter notebook to visualize the simulation results via raster plots (event plots).
* A sample graph was provided in the **_raster_plot_** folder. 
* Please refer to the `README.md` file in the folder for more details.
* Some minor modifications on the parameters of the mechanisms in `task3-2.hoc`.

**Update (June 28, 2021) on `task3-2.hoc`:**
* Inserted `tmgsyn.mod` which simulates short-term (excitatory) synaptic plasticity to the axon of all 12 neurons in the system. 
* Inserted `ipulse1.mod` which includes current clamps (point processes) that deliver a sequence of current pulses at regular intervals.
* Removed the single pulse current clamps.
* Optimisation on neurons' geometric alignment and the insertion of intranodal and internodal synapses.
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
