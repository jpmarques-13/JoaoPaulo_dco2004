clc ; clear ; close all;

%% LOGNORMAL DISTRIBUTION

x = (0:0.1:12500)';
Var=[1 5 10];
figure
chLegend = [];
for i=Var
    pdf = lognpdf(x,10,sqrt(i));
    cdf = logncdf(x,10,sqrt(i));
    subplot(2,1,1);
    plot(x,pdf);
    hold on
    subplot(2,1,2)
    plot(x,cdf)
    hold on
    chLegend = [chLegend; {['Var =  ' num2str(i)]}];
end
subplot(2,1,2);
legend(chLegend);
title('cdf LogNormal')
subplot(2,1,1);
title('pdf LogNormal')
legend(chLegend);

%% RAYLEIGH DISTRIBUTION
clc;
clear;
x = [-20:0.01:60];
MLE=[1 5 10]
figure
chLegend = [];
for i=MLE
    p = raylpdf(x,i);
    c = raylcdf(x,i);
    subplot(2,1,1);
    plot(x,p);
    hold on
    subplot(2,1,2)
    plot(x,c)
    hold on
    chLegend = [chLegend; {['MLE =  ' num2str(i)]}];
end
subplot(2,1,2);
legend(chLegend);
title('cdf Rayleigh')
subplot(2,1,1);
title('pdf Rayleigh')
legend(chLegend);

%% RICIAN DISTRIBUTION
clc;
clear;

sigma = [1 5 10]
Noncentrally = [0 5 10]

figure
chLegend = [];
chLegend1 = [];
for i=sigma
    pd = makedist('Rician','s',0,'sigma',i)
    x = (0:0.1:50);
    y = pdf(pd,x);
    y1 = cdf(pd,x);
    subplot(2,2,1)
    plot(x,y)
    hold on
    chLegend = [chLegend; {['sigma =  ' num2str(i)]}];
    subplot(2,2,2)
    plot(x,y1)
    hold on
    chLegend1 = [chLegend; {['Noncentrality =  ' num2str(0)]}];
end
subplot(2,2,1);
title('pdf Rician')
legend(chLegend);
subplot(2,2,2);
title('cdf Rician')
legend(chLegend1);
for i=Noncentrally
    pd = makedist('Rician','s',i,'sigma',1)
    x = (0:0.1:50)';
    y = pdf(pd,x);
    y1 = cdf(pd,x);
    subplot(2,2,3)
    plot(x,y)
    hold on
    chLegend = [chLegend; {['sigma =  ' num2str(1)]}];
    subplot(2,2,4)
    plot(x,y1)
    hold on
    chLegend1 = [chLegend; {['sigma =  ' num2str(i)]}];
end
subplot(2,2,3);
title('pdf Rician')
legend(chLegend);
subplot(2,2,4);
title('cdf Rician')
legend(chLegend1);

%% Nakagami Distribution
clc;
clear;

sigma = [1 5 10]

figure
chLegend = [];
chLegend1 = [];
for i=sigma
    pd = makedist('Nakagami','mu',1,'omega',i)
    x = (0:0.01:10)';
    y = pdf(pd,x);
    y1 = cdf(pd,x);
    subplot(2,2,1)
    plot(x,y)
    hold on
    chLegend = [chLegend; {['sigma =  ' num2str(i)]}];
    subplot(2,2,2)
    plot(x,y1)
    hold on
    chLegend1 = [chLegend; {['Noncentrality =  ' num2str(1)]}];
    
    pd = makedist('Nakagami','mu',i,'omega',1)
    y = pdf(pd,x);
    y1 = cdf(pd,x);
    subplot(2,2,3)
    plot(x,y)
    hold on
    chLegend1 = [chLegend1; {['sigma1 =  ' num2str(1)]}];
    subplot(2,2,4)
    plot(x,y1)
    hold on
    chLegend1 = [chLegend; {['Noncentrality =  ' num2str(i)]}];
end
subplot(2,2,1);
title('pdf Nakagami')
legend(chLegend);
subplot(2,2,2);
title('cdf Nakagami')
legend(chLegend);
subplot(2,2,3);
title('pdf Nakagami')
legend(chLegend1);
subplot(2,2,4);
title('cdf Nakagami')
legend(chLegend1);


%% Weilbull Distribution
clc;
clear;


sigma = [1 5 10]

figure
chLegend = [];
chLegend1 = [];
for i=sigma
    pd = makedist('Weibul','a',1,'b',i)
    x = (0:0.01:10)';
    y = pdf(pd,x);
    y1 = cdf(pd,x);
    subplot(2,2,1)
    plot(x,y)
    hold on
    chLegend = [chLegend; {['a =  ' num2str(i)]}];
    subplot(2,2,2)
    plot(x,y1)
    hold on
    
    
    pd = makedist('Weibull','a',i,'b',1)
    y = pdf(pd,x);
    y1 = cdf(pd,x);
    subplot(2,2,3)
    plot(x,y)
    hold on
    chLegend1 = [chLegend1; {['b =  ' num2str(i)]}];
    subplot(2,2,4)
    plot(x,y1)
    hold on
   
end
subplot(2,2,1);
title('pdf weilbull')
legend(chLegend);
subplot(2,2,2);
title('cdf weilbull')
legend(chLegend);
subplot(2,2,3);
title('pdf weilbull')
legend(chLegend1);
subplot(2,2,4);
title('cdf weilbull')
legend(chLegend1);

%% exponencial distribution
clc;
clear;


lambda = [2/5 1];

figure
chLegend = [];
for ik=lambda
    pd = makedist('Exponential','mu',ik)
    x = (0:0.1:50)';
    y = pdf(pd,x);
    y1 = cdf(pd,x);
    subplot(2,1,1)
    hold on
    plot(x,y)
    chLegend = [chLegend; {['lambda = ' num2str(ik)]}];
    subplot(2,1,2)
    hold on
    plot(x,y1)
    chLegend = [chLegend; {['lambda = ' num2str(ik)]}];

end
subplot(2,1,1);
title('pdf Exponencial')
legend(chLegend);
subplot(2,1,2);
title('cdf Exponencial')
legend(chLegend);