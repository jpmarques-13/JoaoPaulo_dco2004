import numpy as np           #importando as bibliotecas necessárias:
import matplotlib.pyplot as plt
import scipy.io.wavfile as wv
import os

                             # Parâmetros da onda:
tf = 1                       # Tempo de duração da nota
fc = 512                     # Frequência da nota Dó
fs = 100*fc                  # Frequencia de amostragem da nota.
t =np.arange(0,tf+1/fs,1/fs) # Vetor tempo. Para cada elemento do vetor t, haverá um elemento em y correspondente.
A = 1                        # Amplitude do sinal

TomFreq = [1, 9/8, 5/4, 4/3, 3/2, 5/3, 15/8, 2 ]  # Do = 1, Re = 2, Mi = 3, Fa = 4, Sol = 5, La = 6, Si = 7

plt.figure(1,figsize=[10,7]) # cria instância da figura para poder alterar seu tamanho
for notas in TomFreq :
    y=A*np.cos(2*(notas)*np.pi*fc*t)     # Sinal senoidal
    plt.plot(t,y)                # Visualizar o sinal gerado
    plt.axis([0,0.002,-1,1])      # Zoom para melhor visualização
plt.legend(['Do','Re','Mi','Fa','Sol','La','Si'])
plt.show()

#
