from scipy.stats import norm
import numpy as np
import matplotlib.pyplot as plt


Eb = 1
Er0 = Eb
Er1 = 0

vtEBN0_dB = np.array([-10,0,10])
vtEBN0 = 10**(vtEBN0_dB/10)
vtVar = Eb*Eb/vtEBN0/2

for i in range(len(vtEBN0_dB)):
    dstd = np.sqrt(vtVar[i])
    x = np.arange(-5*dstd-Eb,5*dstd+Eb,0.001)
    vtr0 = norm.pdf(x,Er0,dstd)
    vtr1 = norm.pdf(x,Er1,dstd)
    plt.plot(x,vtr0,x,vtr1)
    plt.show()
