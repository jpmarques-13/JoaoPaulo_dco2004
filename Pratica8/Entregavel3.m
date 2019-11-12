%% BPSK
clc;
clear;
EbN0_dB = [0.5 10]                                          % Eb/N0 de entrada
Ns = 10^5;                                             % Número de símbolos simulados
M = 2;                                                 % Número de símbolo da modulação
bits2 = randi([0 M-1],Ns,1);
txSig = pskmod(bits2,M);


figure
rxSig = awgn(txSig,0.5);
subplot(2,1,1);
plot(rxSig(find(txSig<0)),'ro')
hold on
plot(rxSig(find(txSig>0)),'bo')
rxSig = awgn(txSig,10);
subplot(2,1,2);
plot(rxSig(find(txSig<0)),'ro')
hold on
plot(rxSig(find(txSig>0)),'bo')


%% 8-PSK
clc;
clear;
EbN0_dB = [0.5 20]                                          % Eb/N0 de entrada
Ns = 10^5;                                             % Número de símbolos simulados
M = 8;                                                 % Número de símbolo da modulação
bits2 = randi([0 M-1],Ns,1);
txSig = pskmod(bits2,M);


figure
rxSig = awgn(txSig,EbN0_dB(1));
subplot(2,1,1);
plot(rxSig,'ro')

rxSig = awgn(txSig,EbN0_dB(2));
subplot(2,1,2);
plot(rxSig,'ro')
