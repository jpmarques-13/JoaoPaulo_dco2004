import numpy as np
import scipy.io
from matplotlib import pyplot as plt
import scipy.fftpack as ff

# Como visto anteriormente, para economizar linhas de código, uma boa prática é resumir a conversão
# binário/decimal em duas funções:

def quantizacao(sinal,n):
    L = 2**n
    sig_max = max(sinal)
    sig_min = min(sinal)
    Delta=(sig_max-sig_min)/L                       # Intervalo de quantização (distância entre um nível e outro)
    q_level=np.arange(sig_min+Delta/2,sig_max,Delta) # Vetor com as amplitudes dos Q níveis (Ex: nível 4 -- q_level(4)= -0.05V)
    sigp=sinal-sig_min                                 # Deixa o sinal somente com amplitudes positivas (shift para cima)
    # Calcula a quantidade de nívels (não inteiro ainda) de cada amostra (elementos >= 0)

    sigp //= Delta
    qindex = sigp.astype(int)     #Forçamos o tipo do array como int para usar seus valores como índices
    qindex[qindex >= L] = L-1   #Trunca o excedente de qindex
    quant=q_level[qindex]
    return quant

def de2bi(sinal):
    from numpy import fromiter,binary_repr,round
    sinal_bin = round(sinal).astype(int)
    return fromiter(map(binary_repr,sinal_bin),dtype=int)
#
def bi2de(sinal):
    from numpy import ndarray
    sinal_dec = ndarray(len(sinal),dtype=int)
    for i in range(len(sinal_dec)):
        sinal_dec[i] = int(str(sinal[i]),2)
    return sinal_dec


mat = scipy.io.loadmat('Pacientes.mat')
fs = mat['Fs'][0][0]
ts = 1/fs
sinal_1 = mat['sinal_1'].flatten()
sinal_2 = mat['sinal_2'].flatten()
sinal_3 = mat['sinal_3'].flatten()
sinal_4 = mat['sinal_4'].flatten()
sinal_5 = mat['sinal_5'].flatten()
Tf = ts*len(sinal_1)
t= np.arange(0,Tf,ts)
sinal_1_quant = quantizacao(sinal_1,8)
sinal_2_quant = quantizacao(sinal_2,8)
sinal_3_quant = quantizacao(sinal_3,8)
sinal_4_quant = quantizacao(sinal_4,8)
sinal_5_quant = quantizacao(sinal_5,8)


sinal_1_quant = de2bi(sinal_1_quant)
sinal_2_quant = de2bi(sinal_2)
sinal_3_quant = de2bi(sinal_3)
sinal_4_quant = de2bi(sinal_4)
sinal_5_quant = de2bi(sinal_5)

frameSize = 5;                            # Tamanho do quadro (número máximo de sinais a serem multiplexados)
mux_sig = np.zeros(len(sinal_1_quant)*frameSize,dtype=int)

for i in range(1,len(sinal_1_quant)+1):
    mux_sig[5*(i-1)]      =   sinal_1_quant[i-1]  # Indexação em python começa em 0
    mux_sig[5*(i-1)+1]    =   sinal_2_quant[i-1]
    mux_sig[5*(i-1)+2]    =   sinal_3_quant[i-1]
    mux_sig[5*(i-1)+3]    =   sinal_4_quant[i-1]
    mux_sig[5*(i-1)+4]    =   sinal_5_quant[i-1]

####  FIM DA MULTIPLEXACAO
####  DEMULTIPLEXACAO
demux_01 = np.zeros(len(sinal_1_quant),dtype=int)
demux_02 = np.zeros(len(sinal_1_quant),dtype=int)
demux_03 = np.zeros(len(sinal_1_quant),dtype=int)
demux_04 = np.zeros(len(sinal_1_quant),dtype=int)
demux_05 = np.zeros(len(sinal_1_quant),dtype=int)
for i in range(1,len(sinal_1_quant)):
    demux_01[i-1]= mux_sig[(i-1)*5 ]
    demux_02[i-1]= mux_sig[(i-1)*5 + 2]
    demux_03[i-1]= mux_sig[(i-1)*5 + 3]
    demux_04[i-1]= mux_sig[(i-1)*5 + 4]
    demux_05[i-1]= mux_sig[(i-1)*5 + 5]

sig_rec01 = bi2de(demux_01)
sig_rec02 = bi2de(demux_02)
sig_rec03 = bi2de(demux_03)
sig_rec04 = bi2de(demux_04)
sig_rec05 = bi2de(demux_05)
plt.figure(1,[9,9])
plt.subplot(511)
plt.plot(t[0:1000],sig_rec01[0:1000],t[0:1000],sinal_1[0:1000])
plt.title("Sinal Original vs Sinal Amostrado e Quantizado")
plt.subplot(512)
plt.plot(t[0:1000],sig_rec02[0:1000],t[0:1000],sinal_2[0:1000])
plt.title("Sinal Original vs Sinal Amostrado e Quantizado")
plt.subplot(513)
plt.plot(t[0:1000],sig_rec03[0:1000],t[0:1000],sinal_3[0:1000])
plt.title("Sinal Original vs Sinal Amostrado e Quantizado")
plt.subplot(514)
plt.plot(t[0:1000],sig_rec04[0:1000],t[0:1000],sinal_4[0:1000])
plt.title("Sinal Original vs Sinal Amostrado e Quantizado")
plt.subplot(515)
plt.plot(t[0:1000],sig_rec05[0:1000],t[0:1000],sinal_5[0:1000])
plt.title("Sinal Original vs Sinal Amostrado e Quantizado")

plt.show()
