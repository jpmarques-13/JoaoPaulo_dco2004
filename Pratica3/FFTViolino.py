
import scipy.io.wavfile as wv
import numpy as np
from scipy.fftpack import fft


soundFile = './violino.wav'               # Especifica do local e nome do arquivo de audio
dFa1,vtSom1 = wv.read(soundFile)             # Abre arquivo de audio de um arquivo

# Number of sample points
N1 = len(vtSom1)
# sample spacing
T1 = 1/dFa1
y1 = vtSom1
yf1 = fft(y1)
yf1=yf1/N1
xf1 = np.linspace(0.0, 1.0/(2.0*T1), N1//2)
import matplotlib.pyplot as plt
fig = plt.figure()
ax1=plt.subplot("211")
plt.plot(xf1, 2.0/N1 * np.abs(yf1[0:N1//2]))
plt.grid()



soundFile = './flauta.wav'               # Especifica do local e nome do arquivo de audio
dFa2,vtSom2 = wv.read(soundFile)             # Abre arquivo de audio de um arquivo

# Number of sample points
N2 = len(vtSom2)
# sample spacing
T2 = 1/dFa2
y2 = vtSom2
yf2 = fft(y2)
yf2=yf2/N2
xf2 = np.linspace(0.0, 1.0/(2.0*T2), N2//2)
ax2=plt.subplot("212")
plt.plot(xf2, 2.0/N2 * np.abs(yf2[0:N2//2]))
plt.grid()
ax1.title.set_text('Violino')
ax2.title.set_text('Flauta')
plt.show()
