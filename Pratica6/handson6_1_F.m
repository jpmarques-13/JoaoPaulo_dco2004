clear all;clc;close all;
%% Parâmetros da Sinc
B=100;                                                      % Banda do filtro
Ts=1/(200*pi*B);                                            % Taxa de geração (Passo no tempo)
Fs=1/Ts;                                                    % Frequência de amostragem
N=10000;                                                    % Número de amostras
tf=N*Ts;                                                    % Tempo final
t=-tf:Ts:tf;                                                % Eixo do tempo
lfft=length(t);                                             % Comprimento da FFT
Am=2*Ts*B;                                                  % Amplitude do sinal
%s= (4.5/2)*Am*sinc(4.5*B*t);                                % Sinc para reconstrução no tempo
m=cos(2*pi*200*t)+cos(2*pi*80*t);                           % Sinal m(t)
ret = zeros(1,length(t));
for i = 1:lfft
  ret(i) = ret(i) +(i<((lfft/2)+lfft*Ts*2.25*B) & i>(((lfft)/2)-lfft*Ts*2.25*B));
end
sinc = ifft(ifftshift(ret))*lfft;
%% Convolução
%c=conv(s,m);                                                % Calcula a convolução e realiza a filtragem no tempo
%c=c(1,(length(t)-1)/2:3*(length(t)-1)/2);                   % Ajusta o tamanho do vetor
%% Espectros de frequência
%S=fftshift(fft(s,lfft)/lfft);                               % Sinc S(f)
M=fftshift(fft(m,lfft)/lfft);                               % Sinal M(f) 
C=M.*ret;                                                   % Sinal M(f)
c=ifft(ifftshift(C))*lfft;
freq= -Fs/2:Fs/lfft:Fs/2-Fs/lfft;                           % Eixo da frequência

%% Gráficos 
% Plot do Sinal no tempo
fig = figure;
subplot(3,2,1);                                      
plot(t,m);
title('Sinal Original');
axis([-0.05 0.05 -2 2]);
% Plot do Sinal na frequência                   
subplot(3,2,2);
plot(freq,abs(M));        
title('Espectro do sinal Original');
axis([-800 800 0 0.5]);
%------------------------------------
% Plot do Filtro no tempo
subplot(3,2,3);                                      
plot(t,sinc);
title('Sinc usada para interpolação');
axis([-0.2 0.2 0 200]);
% Plot do Filtro na frequência                   
subplot(3,2,4);
plot(freq,abs(ret));       
title('Espectro da Sinc usada para interpolação');
axis([-400 400 0 2]);
%------------------------------------
% Plot da convolução no tempo                                
subplot(3,2,5);
plot(t,c);      
title('Sinal regenerado por filtragem');
xlabel('Tempo [s]');
axis([-0.05 0.05 -2 2]);
% Plot da convolução na frequência   
subplot(3,2,6);
plot(freq,abs(C));
title('Espectro do sinal regenerado por filtragem');
xlabel('Frequência [Hz]');
axis([-800 800 0 0.5]);

fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 9 9];