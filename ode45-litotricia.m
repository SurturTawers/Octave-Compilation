clear
clc
%%%%%%%%%%%%%%
%1)
F=@(t,z) [z(2);((z(1).^(-3*1.4))-1-(3/2)*z(2).^2)/z(1)];
%%%%%%%%%%%%%%
%2.1)
T=20;
z0=[2.5;0];
options=odeset('AbsTol',1e-6,'RelTol',1e-6);
[t,z]=ode45(F,[0, T],z0,options);
fprintf('Numero de pasos de "ode45": %d\n',size(t,1)-1);
%%%%%
%2.2)
x=z(:,1);
plot(t,x);
%%%%%
%2.3)
display("El periodo de oscilación de la función es aprox. 4.7s");
%%%%%
%2.4)
[t1,z1]=ode15s(F,[0, T],z0,options);
fprintf('Numero de pasos de "ode15s": %d\n',size(t1,1)-1);