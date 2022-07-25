clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1)
% Complete los valores de 
% y0 (vector columna con valores iniciales)
y0 = [0;0;0];
% a (extremo inferior de intervalo de integración)
a =0;
% b (extremo superior de intervalo de integración)
b =21;
% función parte derecha del PVI
f = @(t,W) [-3.6*W(1)+1.2*(W(2)*(1-W(2).^2)-1);
            -1.2*W(2)+6*(W(1)+(2/(1+W(3))));
            -0.12*W(3)+12*W(2)];
% Calculando solución de referencia
options = odeset('AbsTol',1e-10,'RelTol',1e-10);
[tex,yex] = ode45(f,[a,b],y0,options);
yex = yex';
% Graficando soluci'on de referencia
% Componente 1 en figura 1
figure(1)
plot(tex,yex(1,:));
% Se hace hold on para que, al graficar la
% componente 1 de las aproximaciones con Euler expl'icito e impl'icito,
% no se borre la soluci'on de referencia
hold on
% Componente 2 en figura 2
figure(2)
plot(tex,yex(2,:));
% Se hace hold on para que, al graficar la
% componente 2 de las aproximaciones con Euler expl'icito e impl'icito,
% no se borre la soluci'on de referencia
hold on
% Componente 3 en figura 3
figure(3)
plot(tex,yex(3,:));
% Se hace hold on para que, al graficar la
% componente 3 de las aproximaciones con Euler expl'icito e impl'icito,
% no se borre la soluci'on de referencia
hold on

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2)
% Euler (explícito e implícito) con h = 0.1, NO GRAFICAR, SE OBTIENE NAN
% EN ALGUNAS COMPONENTES
h=0.1;
[tExp,WExp]=EulerExplicito(f,y0,a,b,h);
[tImp,WImp]=EulerImplicito(f,y0,a,b,h);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3)
% Euler explícito con h = 0.005
h=0.005;
[tExp1,WExp1]=EulerExplicito(f,y0,a,b,h);
% Euler impl'icito con h = 0.005; 
[tImp1,WImp1]=EulerImplicito(f,y0,a,b,h);
%Grafico junto a las soluciones de referencia
figure(1);
plot(tExp1,WExp1(1,:),'-b');
plot(tImp1,WImp1(1,:),'-r');
figure(2);
plot(tExp1,WExp1(2,:),'-b');
plot(tImp1,WImp1(2,:),'-r');
figure(3);
plot(tExp1,WExp1(3,:),'-b');
plot(tImp1,WImp1(3,:),'-r');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%4)
display("No se refleja la propiedad constante ya que la funcion es oscilante a travez del tiempo")