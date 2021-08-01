# Visualisation of the simulation results

In the raster plots, I visualised the spikes recorded from the first circuit `data[0, :]` or `circuit[0]` under the some randomly selected simulation patterns. The data arrays have dimensions of 10 * 25 * 4, which represents 10 repetitions, 25 time units, and 4 electrode at different corners of the circuit (top left (Tl), top right (Tr), bottom right (Br), and bottom left (Bl)). To plot the diagram more easily, I transposed the data arrays into 4 * 25 * 10 and utilised the following four colours: red (R), green (G), blue(B), and orange (O) to represents the four corners of the circuit, respectively. On the x-axis are the time units while the ten repetitions are placed on the y-axis.


**_Update (August 1, 2021) on `Task4-2.ipynb`_**
* In this update, we made a notebook that streamlined the entire simulation process, from reading the simulated data (voltage) plotting a simulated neuron (average) potential graph. Here, the term *average* means we take the mean of the potential of three neurons' axon in each respective corner. *Refer to `spike_demo.png`.*  
* Moreover, we calculated the probability of spikes based on the simulated results (average) and made a raster plot. *Refer to `simulation_demo.png`.*  
* Now, we only have six results (with no stimulations at all, i.e., `ID=0`) and the spike probability was calculated based on three trials. That is, we have two repetitions only, as shown in the raster plot, which, unlike the experimental data where each circuit each simulation consists of 1800 runs and their spike probabilities were calculated on 180 trials in each repetition.
* Otherwise, the rest of the work was identical to `Task4-1.ipynb`.

**_Update (July 31, 2021) on `Task4-1.ipynb`_**
* In the latest update, a threshold of probability greater than or equal to 0.1 was implemented to the experimental data. That is, if a data point has value greater than or equal to 0.1, it was considered a spike, otherwise it was discarded. However, to prevent 0.1 being normalised to zero (normalisation due to the fact it was needed to show the transparency in the event plot), i.e., [0.1, ~] normalised to [0, 1], we decreased the lower limit to 0.09 so that the 0.1 points will not vanish while producing the raster plot. For those values greater than or equal to 0.1, we scaled the features to lie between the range of zero and one `[0, 1]`, using Python's Scikit-Learn library `sklearn.preprocessing.MinMaxScaler()` to achieve this. The motivation to use this scaling include robustness to very small standard deviations of features and preserving zero entries in sparse data.

**_Update (July 26, 2021) on `Task4-1.ipynb`_**
* In the latest update, the coloured, half-transparent linestyles (dotted, dashes, dot-dashes) which represents different corner of the electrodes in the previous plots were abolished in order to avoid confusion. Instead, different lengths of solid lines were used in addition to the colour scheme mentioned above and they were placed on top of each other. The lengths of the coloured lines are arranged in descending order: red, green, cyan and yellow. 

## Other relevant files in this directory
* `circuit[*] ID[**].png` is the raster plot of `circuit[*]` based on the simulation pattern `ID[**]`.
* `find_signal_peaks.py` is the Python file about finding the peaks of the neuron's potential.
* `find_signal_peaks_demo.py` is a sample of the output graph from `find_signal_peaks.py`.

