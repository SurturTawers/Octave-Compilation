format long;
clear all;clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Funciones para aproximar mediante regla del trapecio
function t=tr_elem(f,a,b)
  t=((b-a)/2)*(f(a)+f(b));
endfunction

function int_tr=tr_comp(f,a,b,n)
  h=(a+b)/n;
  x=zeros(1,n+1);
  for i=1:n+1
    x(i)=a+(i-1)*h;
  endfor
  V_f =zeros(1,n);
  for i=1:n
    V_f(i)=tr_elem(f,x(i),x(i+1));
  endfor
  int_tr=sum(V_f);
endfunction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2)
%g=9.80665
angulo_rad=deg2rad(12);
k=sin(angulo_rad);
%primera aproximacion
a=0;
b=pi/2;
f=@(x) 1/sqrt(1-(k^2)*sin(x).^2);
f_ap=tr_elem(f,a,b);
T_aprox=(4*sqrt(1/9.80665))*f_ap;
display('La primera aproximacion de T es:');
display(T_aprox);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%3)
n=2;
T_ap_0=T_aprox;
T_ap_1=(4*sqrt(1/9.80665))*tr_comp(f,a,b,n);
while abs(T_ap_1-T_ap_0)>10^-12
  n++;
  T_ap_0=T_ap_1;
  T_ap_1=(4*sqrt(1/9.80665))*tr_comp(f,a,b,n);
endwhile
display('El valor obtenido para T cuando la diferencia absoluta de T y su aproximación anterior es menor o igual a 10^-12 es: ');
display(T_ap_1);
display('La diferencia absoluta entre la primera aproximación de T y la ultima aproximación es:');
display(abs(T_ap_1-T_aprox));