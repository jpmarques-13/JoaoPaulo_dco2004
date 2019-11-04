import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import norm

Eb = 1
Er0 = Eb
Er1 = -Eb
vtEbN0_dB = np.array([-10,0,10])
vtEbN0 = 10**(vtEbN0_dB/10)
vtVar = Eb*Eb/vtEbN0/2
for ik in range(len(vtEbN0_dB)):
    dStd = np.sqrt(vtVar[ik])
    x=np.arange(-5*dStd-Eb,5*dStd+Eb,0.001)   ##eixo 5*variancia
    ## Cálculo da distribuicao Gaussiana
    rv1 = norm.pdf(x,Er0,dStd)
    rv2 = norm.pdf(x,Er1,dStd)
    plt.plot(x,rv1,x,rv2)
    plt.show()
