clc; clear;                                
vtnSamples = [1e2 1e3  1e4 1e5];                % Número de amostras
Samples = ceil(6 * rand(1,max(vtnSamples)));
chLegend =[];
for ik = 1:length(vtnSamples)
    nSamples = vtnSamples(ik);
    subplot(length(vtnSamples),1,ik)
    % PDF estimada
    binWidth = 1;
    vtCurrentS = Samples(1:nSamples);
    vtBins = min(vtCurrentS):binWidth:max(vtCurrentS);
    histo=zeros(6,1);
    for v = vtCurrentS
        for k =vtBins
            if (k == v)
                histo(k)=histo(k)+1;
            end
        end
    end
    
    plot(vtBins,histo/(nSamples));
    hold all;
    % Pode ser feito também com
    % histogram(vtSamples(1:nSamples),'Normalization','pdf');
    %
    % PDF real
    %vtPDF=normpdf(x,mu,sigma);
    y=zeros(length(vtBins),1);
    y=y+ 1/6;
    plot(vtBins,y);
    legend(['PDF Estimada = ' num2str(nSamples) ' amostras'],'PDF Real');
end
