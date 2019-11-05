import numpy as np
import matplotlib.pyplot as plt
from scipy import special


def SiOrtogonal(Ebn0_dB,nMCSamples):
    #% Parâmetros de Entrada:
    #%
    #%  EbN0_dB: Eb/N0, considerando Eb = 1
    #%  nMCSamples: número de bits transmitidos para estimar a BER
    #%
    #% Saídas
    #%
    #%  dBER: BER estimada
    #%
    #% Essa função deve ser salva com o nome simOrtogonal.m na mesma pasta
    #% do arquivo h09.ipynb
    #%
    #% Exemplo de uso: [dBER] = simOrtogonal(10,1e5)
    dE = 1                                     #Energia do sinal s0 e s1
    dEbN0 = 10**(Ebn0_dB/10)
    dsgma = dE/np.sqrt(2*dEbN0)
    ## transmissao ##
    vtBin = np.random.randint(2,size=nMCSamples)
    vtIndex0 = []
    vtIndex1 = []
    for i in range(len(vtBin)):
        if vtBin[i] == 0:
            vtIndex0.append(i)
        else:
            vtIndex1.append(i)

    ##Recepção e detecção de erro
    # Gera saída do correlator para cada transmissão de s0
    vtro = np.zeros(len(vtBin))
    vtr1 = np.zeros(len(vtBin))
    vtro[vtIndex0] = dE + dsgma*np.random.randn(1,len(vtIndex0))
    vtr1[vtIndex0] = dsgma*np.random.randn(1,len(vtIndex0))
    # Gera saída do correlator para cada transmissão de s1
    vtro[vtIndex1] = dsgma*np.random.randn(1,len(vtIndex1))
    vtr1[vtIndex1] = dE + dsgma*np.random.randn(1,len(vtIndex1))
    vtBinDetec = 1*(vtro<vtr1)
    vtError = vtBin + vtBinDetec
    nErrors = 0
    for item in vtError:
        if item ==1:
            nErrors +=1

    return nErrors/nMCSamples

vtEbNoSim = np.arange(0,15,1)                  # Valores de Eb/No a serem simulados (dB)
vtEbNoTeo = np.arange(-1,15,0.1)               # Valores de Eb/No para a curva teórica (dB)
vtnMCSamples = [10,100,5000,100000]
vtSimError=np.zeros(len(vtEbNoSim))
vtMarkers = np.array(['s','o','d','*','<'])

vtEbN0_dB = np.arange(-2,12,0.5)
vtEbN0 = 10**(vtEbN0_dB/10)
vtPe = (1/2)*special.erfc(np.sqrt(vtEbN0/np.sqrt(2)))

for i in range(len(vtnMCSamples)):
    nMCSamples = vtnMCSamples[i]
    for ik in range(len(vtSimError)):
        vtSimError[ik] = SiOrtogonal( vtEbNoSim[ik], nMCSamples )
    plt.semilogy(vtEbNoSim,vtSimError,vtMarkers[i])
    #plt.semilogy(vtEbN0_dB,vtPe)
    #plt.show()
vtEbN0_dB = np.arange(-2,12,0.5)
vtEbN0 = 10**(vtEbN0_dB/10)
vtPe = (1/2)*special.erfc(np.sqrt(vtEbN0/np.sqrt(2)))
plt.semilogy(vtEbN0_dB,vtPe)
plt.legend(['BER simulada com 10 amostras','BER simulada com 100 amostras','BER simulada com 5000 amostras','BER simulada com 100000 amostras','teorico - Pe'])
plt.show()
