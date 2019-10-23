clc;
clear;
EbN0_dB = 20;                                          % Eb/N0 de entrada
Ns = 10^5;                                             % Número de símbolos simulados
M = 8;                                                 % Número de símbolo da modulação
bits2 = randi([0 M-1],Ns,1);
txSig = pskmod(bits2,M);
rxSig = awgn(txSig,EbN0_dB);



plot(rxSig,'ro');
hold on;
plot(rxSig(find(real(rxSig)<=0)),'bs')