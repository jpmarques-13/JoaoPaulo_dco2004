import numpy as np
from matplotlib import pyplot as plt
import scipy.io

mat = scipy.io.loadmat('Amostragem.mat')

T =  mat['T']
fs = 1/T
Tf = mat['Tf']
t = mat['t']
fm1 = mat['fm1']
fm2 = mat['fm2']
m_t = mat['m_t']
ts = mat['ts']
N_samp = mat['N_samp']
s_out = mat['s_out']
lfft = mat['lfft']
M_f = mat['M_f']
S_out = mat['S_out']
Fs = mat['Fs']
freq = mat['freq']
L = [8, 32, 128]
sig_max=max(m_t[0])                                     # Encontra pico máximo
sig_min=min(m_t[0])
plt.figure(1,[10,15])
for il in range(0,len(L)):
    Li = L[il]
    Delta=(sig_max-sig_min)/Li                       # Intervalo de quantização (distância entre um nível e outro)
    q_level=np.arange(sig_min+Delta/2,sig_max,Delta) # Vetor com as amplitudes dos Q níveis (Ex: nível 4 -- q_level(4)= -0.05V)

    sigp=m_t[0]-sig_min                                 # Deixa o sinal somente com amplitudes positivas (shift para cima)
    # Calcula a quantidade de nívels (não inteiro ainda) de cada amostra (elementos >= 0)
    sigp //= Delta

    qindex = sigp.astype(int)     #Forçamos o tipo do array como int para usar seus valores como índices
    qindex[qindex >= Li] = Li-1   #Trunca o excedente de qindex
    q_out = q_level[qindex] #Distribui os níveis de cada elemento

    ## Plotting
    plt.subplot('{}1{}'.format(len(L),il+1))
    plt.plot(t[0],q_out,t[0],(m_t[0]-q_out))
    plt.title('Quantização L = {} níveis'.format(Li))
    plt.legend(["Quantizado", "Erro de Quantização"])

plt.show()
