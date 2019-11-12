x = [0:0.01:2];
p = raylpdf(x,0.5);
z = raylcdf(x,0.5);
figure;
plot(x,p)
figure;
plot(z,p)