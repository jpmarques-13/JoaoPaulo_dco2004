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

def SiAntipodal(EbN0_dB,nMCSamples):

    #Entrada:
    #%
    #%  EbN0_dB: Eb/N0, considerando Eb = 1
    #%  nMCSamples: número de bits transmitidos para estimar a BER
    #%
    #% Saídas
    #%
    #%  dBER: BER estimada
    #%
    #% Essa função deve ser salva com o nome simAntipodal.m na mesma pasta
    #% do arquivo h09.ipynb
    #%
    #% Exemplo de uso: [dBER] = simAntipodal(10,1e5);
    #% Parâmetros
    dE = 1
    dEbN0 = 10**(EbN0_dB/10)
    dsgma = dE/np.sqrt(2*dEbN0)
    ## transmissao
    #geracao dos numeros binario 0 e 1 com igual probabilidade
    vtBin = np.random.randint(2,size=nMCSamples)
    vtIndex0 = []
    vtIndex1 = []
    for i in range(len(vtBin)):
        if vtBin[i] == 0:
            vtIndex0.append(i)
        else:
            vtIndex1.append(i)
    vtr = np.zeros(len(vtBin))
    vtr[vtIndex0] = dE + dsgma*np.random.randn(1,len(vtIndex0))
    # Gera saída do correlator para cada transmissão de s1
    vtr[vtIndex1] = -dE + dsgma*np.random.randn(1,len(vtIndex1))
    vtBinDetec = 1*(vtr<0)
    vtError = vtBin + vtBinDetec
    nErrors = 0
    for item in vtError:
        if item ==1:
            nErrors +=1

    return nErrors/nMCSamples

nMCSamples = 100000
vtEbN0Sim_db = np.arange(0,13,1)
vtEbN0Teo_dB = np.arange(0,12.1,0.1)
vtEbN0Teo = 10**(vtEbN0Teo_dB/10)
vtSimErrorAnti = np.zeros(len(vtEbN0Sim_db))
vtSimErrorOrto = np.zeros(len(vtEbN0Sim_db))
for ik in range(len(vtEbN0Sim_db)):
    vtSimErrorAnti[ik]= SiAntipodal(vtEbN0Sim_db[ik], nMCSamples)
    vtSimErrorOrto[ik]= SiOrtogonal(vtEbN0Sim_db[ik], nMCSamples)

vtTeoErrorAnti = (1/2)*special.erfc(np.sqrt(2*vtEbN0Teo/np.sqrt(2)))
vtTeoErrorOrto = (1/2)*special.erfc(np.sqrt(vtEbN0Teo/np.sqrt(2)))
plt.semilogy(vtEbN0Sim_db,vtSimErrorAnti,'s',vtEbN0Sim_db,vtSimErrorOrto,'d')
plt.semilogy(vtEbN0Teo_dB,vtTeoErrorAnti,vtEbN0Teo_dB,vtTeoErrorOrto)
plt.legend(['BER antipodal','BER ortogonal','pe Antipodal','pe Ortogonal'])
plt.show()
