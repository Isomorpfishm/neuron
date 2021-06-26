#import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from scipy.signal import find_peaks

data = pd.read_csv('C:/Users/yyoon.ces/Desktop/NEURON 8.0 AMD64/Task/task3-2_v_STh0-soma-0.5.txt', sep="\t", header=None)
data.columns = ["time", "voltage"]
x = data["voltage"]

peaks, _ = find_peaks(data["voltage"], height=-55)

plt.plot(data["voltage"])
plt.plot(peaks, x[peaks], "x")
plt.axhline(y=-55, color='r', linestyle='-')
plt.savefig("fig", dpi=600)
plt.show()
