%Declaracion funcion y sus derivadas.
x=linspace(0,10);
f=@(x)(3*x.^2 + x)./(50 + x.^3);
df=@(x)(-3*x.^4 -2*x.^3 +300*x +50)./(50 + x.^3).^2;
ddf=@(x)6*(x.^6+x.^5 -350*x.^3 -100*x.^2 +2500)./(50 +x.^3).^3;

%Grafica de f, df y ddf.
plot(x,f(x));grid on;hold all;
plot(x,df(x));

%Aproximacion al cero de df.
cerodf=newtonraphson(df,ddf,5,10.^(-8),100);

%Grafica valor máximo de f.
plot(cerodf,f(cerodf),'o');
