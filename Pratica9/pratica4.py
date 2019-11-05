from scipy import special
import matplotlib.pyplot as plt
import numpy as np

vtEbN0_dB = np.arange(-10,10,0.5)
vtEbN0 = 10**(vtEbN0_dB/10)
vtPe = (1/2)*special.erfc(np.sqrt(vtEbN0/2))   
plt.semilogy(vtEbN0_dB,vtPe)
plt.show()
