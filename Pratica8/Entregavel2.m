clc;clear;
%%sinal real

Sinal=load('Pratica_08_sinal_real.mat')
y=Sinal.y;
Am=Sinal.Am;
fs=Sinal.fs;
fm=Sinal.fm;

t = 0:1/fs:0.5;

x = Am*cos(2*pi*fm*t);
noise = y-x;
Pxr=var(x);
Pnr=var(noise);

SNRr = 20*log10(Pxr/Pnr);


%% sinal complexo
clear; clc;
Sinal2=load('Pratica_08_sinal_complexo.mat');
y=Sinal2.y;
Ar=Sinal2.Ar;
Ai=Sinal2.Ai;
fs=Sinal2.fs;
fm=Sinal2.fm;

t = 0:1/fs:0.5;

x = Ar*cos(2*pi*fm*t)+ j*Ai*cos(2*pi*fm*t);
noise = y-x;

Pxi=var(x);
Pni=var(noise);

SNRi = 20*log10(Pxi/Pni);