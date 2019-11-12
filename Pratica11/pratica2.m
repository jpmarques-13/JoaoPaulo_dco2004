N = 1e6;                         %numero de amostras
vtk = [0 5 10];                   %fatores K Ricianos a simular
totPower = 1;                     %total power of Los Path & Scattered path


% for loop valores de K
for ik=1:length(vtk);
    subplot(length(vtk),1,ik)
    hold on
    K = vtk(ik);
    s = sqrt(K/(K+1)*totPower);            % parametro de nao centralidade
    sigma = totPower/sqrt(2*(K+1));
    %Amostras do canal Rice
    X = s + sigma*randn(N,1);                %LOS: VA Gaussiana com media=s e sigma definido
    Y = 0 + sigma*randn(N,1);                %NLOS: Gaussiana com media=0 e sigma definido
    Z = X + j*Y;
    [val,bins] = hist(abs(Z),100);         %Histograma de Z
    %
    % PDF Rice Teorica
    binWidth = bins(2)-bins(1);
    r = 0:binWidth:max(bins);
    %PDF teorica rayleigh
    if K == 0
        rayleigh_PDF = r./(sigma^2).*exp(-r.^2/(2*sigma^2));
        plot(r,rayleigh_PDF,'g*')
    end
    fRice = 2*r*(K+1)/totPower.*exp(-r.^2*(K+1)/totPower-K).*besseli(0,2*r*sqrt(K*(K+1)/totPower));
    % graficos
    bar(bins,val/(binWidth*sum(val)))
    plot(r,fRice,'r')
    
end