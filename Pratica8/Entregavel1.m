%% AWGN complexo
clc;clear all;close all; 
                                             % Parâmetros
SNR_dB = 5;                                  % Determina o valor da SNR em dB
T=0.0001;
t = 0:T:5;                                   % Eixo do tempo
x=2*cos(2*pi*10*t)+i*0.2*cos(2*pi*10*t);     % Sinal qualquer x(t)
N = length(x);                               % Calcula o comprimento de x
Ps = sum(abs(x).^2)/N;                       % Calcula a potência do sinal
SNR = 10^(SNR_dB/10);                        % Calcula a SNR linear
Pn = Ps/SNR;                                 % Calcula a potência do ruído
noiseSigma = sqrt(Pn/100);                    % Desvio padrão do ruído normalizado 
n = noiseSigma*[randn(1,N)+j* randn(1,N)];   % Vetor do ruído 
Fs = 1/T
lfft=length(n);                              % Comprimento da FFT
S=fftshift(fft(n,lfft))/lfft;
freq = -Fs/2:Fs/lfft:Fs/2-Fs/lfft;
plot(freq,S)




%sound(abs(n),Fs);