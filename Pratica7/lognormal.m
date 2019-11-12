clc; clear all;close all;
%% lognormal
clc; clear all;close all;
%% Parâmetros da distribuição
vtMu = [0 -1 1];              % Valores de média da Gaussiana
vtVar = [1 5 10];               % Valores de variância da Gaussiana
x = (10:1000:125010);
sigma = sqrt(vtVar(1));
% Variando a média e plotando os gráficos
fig = figure;
chLegend = [];
for ik=vtMu
    mu = ik;
    pd = makedist('Lognormal','mu',0,'sigma',1)
    vtPDF = pdf(pd,x);
    vtCDF= cdf(pd,x);
    subplot(2,2,1);
    plot(x,vtPDF);
    hold all;
    subplot(2,2,2);
    plot(x,vtCDF);
    hold all;
    %
    chLegend = [chLegend; {['Média =  ' num2str(mu )]}];
end
subplot(2,2,1);
legend(chLegend);
subplot(2,2,2);
legend(chLegend);
% Variando a variância e plotando gráficos
mu = vtMu(1);
chLegend = [];
for ik=vtVar
    sigma = sqrt(ik);
    vtPDF=normpdf(x,mu,sigma);
    vtCDF=normcdf(x,mu,sigma);
    subplot(2,2,3);
    plot(x,vtPDF);
    hold all;
    subplot(2,2,4);
    plot(x,vtCDF);
    hold all;
    %
    chLegend = [chLegend; {['\sigma =  ' num2str(sigma)]}];
end
subplot(2,2,3);
legend(chLegend);
subplot(2,2,4);
legend(chLegend);
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 12 6];

pd = makedist('Lognormal','mu',0,'sigma',1)
x = (10:1000:125010);
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
%% Rayleigh
x = [0:0.01:2];
p = raylpdf(x,0.5);
z = raylcdf(x,0.5);
figure;
plot(x,p)
figure;
plot(z,p)

%% Rice
pd = makedist('Rician','s',1,'sigma',1)
x = 0:0.2:10;
y = pdf(pd,x);
z = cdf(pd,x);
figure
plot(x,z)

%% Nakagami
pd = makedist('Nakagami','mu',1,'omega',1)
x = -10:0.2:10;
y = pdf(pd,x);
z = cdf(pd,x);
figure
plot(x,y)

%% Weibulllambda = 1:6;
lambda = 1:6;
y  = wblpdf(0.1:0.1:0.6,lambda,1)
y1 = exppdf(0.1:0.1:0.6,lambda)
plot(y)