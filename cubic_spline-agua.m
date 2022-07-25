clear all; clear clc;
temp=[0,10,20,30,40,50,60,70,80,90,100];
dens=[1000,1000,998,996,992,988,983,978,972,965,958];
visc=[1.788,1.307,1.003,0.799,0.657,0.548,0.467,0.405,0.355,0.316,0.283];
viscCin=[1.788,1.307,1.005,0.802,0.622,0.555,0.475,0.414,0.365,0.327,0.295];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1)
%calculo la spline cubica para la temperatura y densidad
spTD=spline(temp,dens);
%aproximaciones de densidad
display('Los valores aproximados de densidad c/r a la temperatura en 34,68,86 y 91 °C son: ')
spTD34=ppval(spTD,34)
spTD68=ppval(spTD,68)
spTD86=ppval(spTD,86)
spTD91=ppval(spTD,91)
ptsDx=[34,68,86,91];
ptsDy=[spTD34,spTD68,spTD86,spTD91];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2)
%calculo la spline cubica para la temperatura y viscosidad
spTV=spline(temp,visc);
pts=linspace(min(temp),max(temp));%ptos para graficar
%aproximaciones de viscosidad
display('Los valores aproximados de viscosidad c/r a la temperatura en 34,68,86 y 91 °C son: ')
spTV34=ppval(spTV,34)
spTV68=ppval(spTV,68)
spTV86=ppval(spTV,86)
spTV91=ppval(spTV,91)
ptsVx=[34,68,86,91];
ptsVy=[spTV34,spTV68,spTV86,spTV91];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3)
%calculo la spline cubica para la temperatura y viscosidad cinematica
spTVc=@(z)spline(temp,viscCin,z);
spTVC=spline(temp,viscCin);
display("La temperatura aproximada para una viscosidad cinematica de 1*10^-5 es:");
dvc=fzero(@(z) spTVc(z)-1,1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Graficos
%grafico de la temperatura vs densidad (y sus aproximaciones)
figure(1);
plot(temp,dens,'ro',pts,ppval(spTD,pts),'-b');hold on;
plot(ptsDx,ptsDy,'go');
title('Temperatura v/s Densidad');
xlabel('Temperatura(°C)');
ylabel('Densidad (kg/m^3)');
%grafico de la temperatura vs viscosidad (y sus aproximaciones)
figure(2);
plot(temp,visc,'ro',pts,ppval(spTV,pts),'-c');hold on;
plot(ptsVx,ptsVy,'go');
title('Temperatura v/s Viscosidad');
xlabel('Temperatura(°C)');
ylabel('Viscosidad(*10^-3 N*s/m^2)');
%grafico de la temperatura vs viscosidad cinematica
figure(3);
plot(temp,viscCin,'ro',pts,ppval(spTVC,pts),'-m',dvc,ppval(spTVC,dvc),'go');hold on;
title('Temperatura v/s Viscosidad cinematica');
xlabel('Temperatura(°C)');
ylabel('Viscosidad Cinematica (*10^-5 m^2/s)');