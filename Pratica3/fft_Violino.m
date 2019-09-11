close all;clc;clear all;                                          
soundviolino = ['/violino.wav']; 
soundflauta = ['/flauta.wav'];

[x, Fs1] = audioread(soundviolino);  
[y, Fs2] = audioread(soundflauta);

L1=length(x);
T1=1/Fs1;
L2=length(y)
T2=1/Fs2;

X=fft(x);
Y=fft(y);

f1 = (Fs1)*(0:(L1/2))/L1;
f2 = (Fs2)*(0:(L2/2))/L2;


Y = abs(2*Y/L2);
X = abs(2*X/L1);

P1 = X(1:(L1/2)+1);
P2 = Y(1:(L2/2)+1);
h=figure
subplot(2,1,1)
plot(f1,P1)

title('Violino')



subplot(2,1,2)
plot(f2,P2)

title('flauta')
