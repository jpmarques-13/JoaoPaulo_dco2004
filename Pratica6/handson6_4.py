import numpy as np
import scipy.io
from matplotlib import pyplot as plt

# Como visto anteriormente, para economizar linhas de código, uma boa prática é resumir a conversão
# binário/decimal em duas funções:





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
sinal_1 = mat['sinal_1'][0]
sinal_2 = mat['sinal_2'][0]
sinal_3 = mat['sinal_3'][0]
sinal_4 = mat['sinal_4'][0]
sinal_5 = mat['sinal_5'][0]
Tf = ts*len(sinal_1)
t= np.arange(0,Tf,ts)

sig_quan01= sinal_1-np.min(sinal_1)+1      # Todos elementos positivos
sig_quan01= np.round(sig_quan01)           # Transforma sinal em números inteiros
sig_code01= de2bi(sig_quan01)              # Transforma em sinal binário

sig_quan02= sinal_2-np.min(sinal_2)+1      # Todos elementos positivos
sig_quan02= np.round(sig_quan02)           # Transforma sinal em números inteiros
sig_code02= de2bi(sig_quan02)              # Transforma em sinal binário

sig_quan03= sinal_3-np.min(sinal_3)+1      # Todos elementos positivos
sig_quan03= np.round(sig_quan03)           # Transforma sinal em números inteiros
sig_code03= de2bi(sig_quan03)              # Transforma em sinal binário

sig_quan04= sinal_4-np.min(sinal_4)+1      # Todos elementos positivos
sig_quan04= np.round(sig_quan04)           # Transforma sinal em números inteiros
sig_code04= de2bi(sig_quan04)              # Transforma em sinal binário

sig_quan05= sinal_5-np.min(sinal_5)+1      # Todos elementos positivos
sig_quan05= np.round(sig_quan05)           # Transforma sinal em números inteiros
sig_code05= de2bi(sig_quan05)              # Transforma em sinal binário

frameSize = 5;                            # Tamanho do quadro (número máximo de sinais a serem multiplexados)
mux_sig = np.zeros(len(sig_code01)*frameSize,dtype=int)

for i in range(1,len(sig_code01)+1):
    mux_sig[5*(i-1)]      =   sig_code01[i-1]  # Indexação em python começa em 0
    mux_sig[5*(i-1)+1]    =   sig_code02[i-1]
    mux_sig[5*(i-1)+2]    =   sig_code03[i-1]
    mux_sig[5*(i-1)+3]    =   sig_code04[i-1]
    mux_sig[5*(i-1)+4]    =   sig_code05[i-1]
demux_01 = np.zeros(len(sig_code01),dtype=int)
demux_02 = np.zeros(len(sig_code01),dtype=int)
demux_03 = np.zeros(len(sig_code01),dtype=int)
demux_04 = np.zeros(len(sig_code01),dtype=int)
demux_05 = np.zeros(len(sig_code01),dtype=int)
for i in range(1,len(sig_code01)):
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

# Quantização
sig_max=max(sig_quan01)                                  # Encontra pico máximo
sig_min=min(sig_quan01)
n = 8;                                              # Número de bits por nível
L= 2**n;                                            # Níveis de quantização
Delta=(sig_max-sig_min)/L                           # Intervalo de quantização (distância entre um nível e outro)
q_level=np.arange(sig_min+Delta/2,sig_max,Delta)    # Vetor com as amplitudes dos Q níveis
qindex = sig_quan01.astype(int)                  # Casting para inteiro (garantindo que é do tipo inteiro)
q_out=q_level[abs(qindex-1)]
print(len(sig_quan01))
print(len(sinal_1))
plt.figure(1,[9,9])
plt.subplot(211)
plt.plot(t,sinal_1,t,sig_quan01)
plt.title("Sinal Original vs Sinal Amostrado e Quantizado")
plt.show()
