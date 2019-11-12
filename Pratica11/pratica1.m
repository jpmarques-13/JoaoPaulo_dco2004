%Parametros
N = 20000;                                        %numero de amostras
ts = 0.1;
x = 0:ts:(5+ts);                              %eixo X
sigm = 1;
u = rand(N,1);                                    %Amostras aleatórias uniformemente distribuidas
%% canal rayleigh real via método de inversao
rReal = sigm*sqrt(-2*log(u));

pdfTeo = x/(sigm^2).*exp(-(x/sigm).^2/2);         %PDF rayleigh teorico

%
%% canal Rayleigh complexo via VAs Gaussianas independentes
rComplexo = randn(N,1)+j*randn(N,1);

%%graficos
figure
subplot(3,1,1)
%Histograma do canal real vs PDF teorica
[xh,temp] = hist(rReal,x);

width = ts;
a=plot(x,pdfTeo,'k')
hold on
b=bar(temp,xh/(sum(xh)*ts))
uistack(b,'bottom')

% Histograma da envoltória do canal complexo vs PDF teórica
subplot(3,1,2)
[xh, temp]=hist(abs(rComplexo),x);
width = ts;
plot(x,pdfTeo,'k')
hold on
b=bar(temp,xh/(sum(xh)*ts))
uistack(b,'bottom')
% Histrograma da Fase do Canal complexo
subplot(3,1,3)
[xhra, tempra]=hist(angle(rComplexo))
bar(180/pi*tempra,xhra/(sum(xhra)*ts))