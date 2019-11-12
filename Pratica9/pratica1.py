import numpy as np
import matplotlib.pyplot as plt


k = 20
l = np.arange(0,k,1)

#sinal antipodal
s0 = np.ones(k)                                  #sinal 1
s1 = np.hstack((s0[0:int(k/2)],-s0[int(k/2):k])) #sinal 2

#iniciando saida do correlator
r0 = np.zeros(k)
r1 = np.zeros(k)

#variancia
vtVar = [0,0.1,1]
plt.subplot(2*len(vtVar)+1, 2, 1)
plt.plot(l,s0)
plt.legend(['sinal s0'])
plt.subplot(2*len(vtVar)+1, 2, 2)
plt.plot(l,s1)
plt.legend(['sinal s1'])
## correlacao para s0
for i in range(len(vtVar)):
    vtNoise = np.sqrt(vtVar[i])*np.random.randn(k)

    rs0 = s0 + vtNoise                                  #sinal que chega no correlator ao enviar s0

    for n in range(k):
        r0[n] = np.sum(rs0[0:n]*s0[0:n])                #r0 quando foi enviado s0
        r1[n] = np.sum(rs0[0:n]*s1[0:n])                #r1 quando foi enviado s1
    plt.subplot(2*len(vtVar)+1, 2, 2*(i+1)+1)
    plt.plot(l,rs0)
    plt.legend(['sinal s0 + n(t), o² ='+str(vtVar[i])])
    plt.subplot(2*len(vtVar)+1, 2, 2*len(vtVar)+2+2*(i+1)-1)
    plt.plot(l,r0,l,r1,'--')
    plt.legend(['sinal r0', 'sinal r1'])
## correlacao para s1
for i in range(len(vtVar)):
    vtNoise = np.sqrt(vtVar[i])*np.random.randn(k)
    rs1 = s1 + vtNoise                                   #sinal que chega no correlator ao enviar s1
    for n in range(k):
        r0[n] = np.sum(rs1[0:n]*s0[0:n])                 #r0 quando foi enviado s1
        r1[n] = np.sum(rs1[0:n]*s1[0:n])                 #r1 quando foi enviado s1
    plt.subplot(2*len(vtVar)+1, 2, 2*(i+1)+2)
    plt.plot(l,rs1)
    plt.legend(['sinal s1 + n(t), o² ='+str(vtVar[i])])
    plt.subplot(2*len(vtVar)+1, 2,2*len(vtVar)+2+2*(i+1))
    plt.plot(l,r0,l,r1,'--')
    plt.legend(['sinal r0', 'sinal r1'])
plt.show()
