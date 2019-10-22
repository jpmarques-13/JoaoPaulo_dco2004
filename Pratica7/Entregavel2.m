clc;clear all; close all;
%% Parte 1 Distribuicao NORMAL
mu = 5000;                                                 % Média
sigma = 40;                                            % Desvio padrâo
T=0.001;                                                % Taxa de amostragem
x=4800:T:5200;                                               % Eixo x       
% Distribuição
DistNorm=normpdf(x,mu,sigma);                           % Distribuição normal    
% Estimação da probabilidade
indices = min(find(x<=5038)):max(find(x>=5038)); % Encontra o local que se deseja estimar
prob1=sum(DistNorm(indices))*T*100;                     % Probabilidade de um evento ocorrer no intervalo
plot(x,DistNorm);                                       
title([ 'Probabilidade de =  ' num2str(prob1)  ]);      % Mostra valor verdadeiro de prob1
hold on;
area(x(indices),DistNorm(indices));                      % Probabilidade 
% Outra maneira de calcular
syms xs fs;
fs = 1/(sqrt(2*pi*sigma^2))*exp(-(xs-mu)^2/(2*sigma^2));
prob2 = eval(int(fs,-sigma,sigma))*100;
disp([' Probabilidade pela integral da fórmula da PDF = ' num2str(prob1) ' %']);
disp([' Probabilidade pela área da PDF = ' num2str(prob2) ' %']);

%% Parte 2 Distribuicao EXPONENCIAL
clc;
clear;
op1 = makedist('Exponential','mu',2)
op2 = makedist('Exponential','mu',5)
T=0.01;
x = 0:T:20;
pdf1 = pdf(op1,x);
pdf2 = pdf(op2,x);
a=min(find(x>=3));
b=max(find(x>=3));  
indices = a:b;
prob1 = sum(pdf1(indices))*T*100;
prob2 = sum(pdf2(indices))*T*100;
subplot(2,1,1)
plot(x,pdf1);  
hold on
area(x(indices),pdf1(indices))
title([ 'Probabilidade de =  ' num2str(prob1)  ]); 
subplot(2,1,2)
plot(x,pdf2);  
hold on
area(x(indices),pdf2(indices))
title([ 'Probabilidade de =  ' num2str(prob2)  ]); 
