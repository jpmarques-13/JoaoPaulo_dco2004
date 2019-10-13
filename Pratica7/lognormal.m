clc; clear all;close all;
%% Parâmetros da distribuição
pd = makedist('Lognormal','mu',0,'sigma',1)
x = (10:1000:125010)';
y = pdf(pd,x);
figure
plot(x,y)
h = gca;
h.XTick = [0 30000 60000 90000 120000];
figure
x = 0:0.2:10;
mu = 0;
sigma = 1;
p = logncdf(x,mu,sigma);
plot(x,p)
grid on
xlabel('x')
ylabel('p')