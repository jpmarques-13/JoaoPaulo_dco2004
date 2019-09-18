import numpy as np
from scipy.signal import hilbert
import matplotlib.pyplot as plt
import scipy.fftpack as ff
## parametros da modulacao AM-DSB
fs = 600
t = np.arange(0,1-1/fs,1/fs)
fm = 3
fc = 50
indice = 0.7
portadora = np.cos(2*np.pi*t*fc)
sinal_modulante = indice*np.cos(2*np.pi*fm*t)
sinal_modulado = (1 + indice*np.cos(2*np.pi*fm*t))*portadora
## utilizando a transformada de hilbert para trabalhar com sinais analiticos
sinal_analitico = hilbert(sinal_modulado)
inst_phase = np.unwrap(np.angle(sinal_analitico))

sinal_recuperado = np.abs(sinal_analitico)
portadora_recuperada = np.cos(inst_phase)


plt.title('Demodulação AM com a Transforda de Hilbert')
plt.xlabel('Tempo [s]')
plt.ylabel('Amplitude')
plt.plot(t,sinal_modulante,t,sinal_recuperado,t,sinal_modulado)
plt.ylim([-2,2])
plt.xlim([0,1])
plt.legend(['m(t) original','m(t) demodulado','s(t) sinal modulado'])
plt.show()

## trabalhando com sinais no dominio da Frequencia
lfft = len(t)*10
lfft = int(2**np.ceil(np.log2(lfft)))
modulante_fft = ff.fftshift(ff.fft(sinal_modulante,lfft,axis=0)/np.sqrt(lfft))
modulante_fft=np.abs(modulante_fft)
recuperado_fft = ff.fftshift(ff.fft(sinal_recuperado,lfft,axis=0)/np.sqrt(lfft))
recuperato_fft = np.abs(recuperado_fft)
modulado_fft = ff.fftshift(ff.fft(sinal_modulado,lfft,axis=0)/np.sqrt(lfft))
modulado_fft = np.abs(modulado_fft)

freq = np.arange(-lfft/2,lfft/2,1)/(lfft/fs)

plt.title('Sinais modulante e recuperado no domínio da frequência')
plt.xlabel('freq [Hz]')
plt.ylabel('Amplitude')
plt.plot(freq,modulante_fft,freq,recuperado_fft)
plt.ylim([0,10])
plt.legend(['M(f) original','M(f) demodulado'])
plt.show()

plt.title('Sinal modulado no domínio da frequência')
plt.xlabel('freq [Hz]')
plt.ylabel('Amplitude')
plt.plot(freq,modulado_fft)
plt.ylim([0,10])
plt.legend(['M(f) original','M(f) demodulado'])
plt.show()


plt.title('Portadora recuperada atraves da fase instantanea')
plt.xlabel('tempo [s]')
plt.ylabel('Amplitude')
plt.plot(t,portadora,t,np.cos(inst_phase))
plt.legend(['portadora original','portadora recuperada'])
plt.show()
