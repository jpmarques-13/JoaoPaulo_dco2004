%Parametros
N = 10e4;                                   %numero de símnolos BPSK a serem transmitidos
EbN0dB = -5:2:20;                           %valores EbN0 a simular
EbN0 = 10.^(EbN0dB/10);                     %EbN0 em escala linear
totPower = 1;                               %Potencia total (LOS + NLOS)
K = [0 5 30];                               %valores de K Ricianos a simular

%% Transmissor

d = rand(N,1) > 0.5;                        %Dados binários
x = 2*d -1;                                 %símbolos BPSK

%% inicializacao de valores BER simulada e teorica

simBER_ricean = zeros(length(EbN0dB),1);
figure
plotStyleSim=[ 'b:s' 'b:s' 'b:s' ];

%% Loop de K Riciano

for index = 1:length(K)
    k = K(index);                           %valor de k corrente
    plotStyle = plotStyleSim(index);
    disp(plotStyle)
    % mensagem de processo da simulacao
    disp(['Simulando K = ' num2str(k)])
    %canal 
    %parametro de nao centralidade e sigma de Rice
    s = sqrt(k/(k+1)*totPower);
    sigma = totPower/sqrt(2*(k+1));
    %
    % loop de EbNo
    for i = 1:length(EbN0dB)
        %Continuacao do canal
        %
        %Ruido AWGN complexo com media 0 e variancia 1
        noise = 1/sqrt(2)*(randn(N,1)+j*randn(N,1));
        %vetor de ruido com potencia proporcional a EbN0 corrente
        n = noise*10^(-EbN0(i)/20);
        h = ((sigma.*randn(N,1)+s)+j*(randn(N,1)*sigma+0));
        %
        %receptor
        %Sinal recebido do canal Rice e AWGN
        y_ricean = h.*x+n;
        %Receptor coerente : equalizacao + decisao
        y_ricean_cap = y_ricean./h;
        r_ricean = real(y_ricean_cap)>0;
        %contador de erro
        simBER_ricean(i) = sum(xor(d,r_ricean));
        %fim do noo EbNo
    end
       
    %calculo da BER para valor k corrente
    simBER_ricean = simBER_ricean/N;
    semilogy(EbN0dB,simBER_ricean,plotStyle);
    hold on
end

BER_rayleigh_teorica = 0.5.*(1-sqrt(EbN0).*sqrt((1./(1+EbN0)))); 
BER_awgn_teorica = qfunc(sqrt(2*EbN0));
%% graficos
% Rayleigh teórico
hold on
semilogy(EbN0dB,BER_rayleigh_teorica,'k-')
% AWGN teórico
hold on
semilogy(EbN0dB,BER_awgn_teorica,'b--')
hold off