clear;clc;
%temperatura
x=[300 400 500 600 700 800 900 1000 1100];
%emisividad termica
y=[0.024 0.035 0.046 0.058 0.067 0.083 0.097 0.111 0.125];
plot(x,y,'bo');hold on;
xlabel('Temperatura [k]'); ylabel('Emisividad termica');
%%PARTE 1 INTERPOLACION
%1)calculo el polinomio de grado 8 que interpola los datoss
p=polyfit(x(1:9),y(1:9),8);
p_350=polyval(p,350);p_550=polyval(p,550);p_850=polyval(p,850);
%2)grafica del polinomio 'p'.
%en xx,las posiciones: 1 es 300, 126 es 400, 251 es 500
%376 es 600, 501 es 700, 626 es 800, 751 es 900,
%876 es 1000 y 1001 es 1100.
xx=300:0.8:1100;
plot(xx,polyval(p,xx),'b--');
%grafica de los puntos.
plot(350,p_350,'ro');plot(550,p_550,'ro');plot(850,p_850,'ro');
%%PARTE 2 SPLINE CUBICA
%1)spline cubica.
s=spline(x,y);
s_350=ppval(s,350);s_550=ppval(s,550);s_850=ppval(s,850);
plot(xx,ppval(s,xx),'g--');
plot(350,s_350,'go');plot(550,s_550,'go');plot(850,s_850,'go');
%2)calculo de diferencias.
dif_350=abs(p_350 - s_350);
dif_550=abs(p_550 - s_550);
dif_850=abs(p_850 - s_850);
%PARTE 3 APROXIMACION A 350
%1) y 2) calculo de polinomios y puntos.
q=polyfit(x(1:4),y(1:4),3);q_350=polyval(q,350);
r=polyfit(x(1:5),y(1:5),4);r_350=polyval(r,350);
ss=polyfit(x(1:6),y(1:6),5);ss_350=polyval(ss,350);
plot(350,q_350,'yo');plot(350,r_350,'mo');plot(350,ss_350,'co');
%3)calculo la menor diferencia con la spline.
difq_350=abs(q_350 - s_350)
difr_350=abs(r_350 - s_350)
difss_350=abs(ss_350 - s_350)
%la aproximacion mas cercana es con el polinomio r.
display('r es la aproximacion en 350 mas cercana a la spline cubica');