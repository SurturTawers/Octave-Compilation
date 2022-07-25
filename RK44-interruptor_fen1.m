clear;
clc;
%UTILICE RK44 DEL CAPITULO 6  
%%%%%%%%%%%%%%%%%%
%1)
figure(1);
g=@(z) 0.1-1.51*z +3.03*(z.^2)/(1+z.^2);
[x,y]=RK44(g,0,1,0,100);
plot(x,y);hold on;

g=@(z) 0.2-1.51*z +3.03*(z.^2)/(1+z.^2);
[x1,y1]=RK44(g,0,1,0,100);
plot(x1,y1);hold on;

g=@(z) 0.3-1.51*z +3.03*(z.^2)/(1+z.^2);
[x2,y2]=RK44(g,0,1,0,100);
plot(x2,y2);hold on;

g=@(z) 0.4-1.51*z +3.03*(z.^2)/(1+z.^2);
[x3,y3]=RK44(g,0,1,0,100);
plot(x3,y3);hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%2)
figure(2);
g=@(z) 0.201-1.51*z +3.03*(z.^2)/(1+z.^2);
[xx,yy]=RK44(g,0,1,0,100);
plot(xx,yy);hold on;

g=@(z) 0.202-1.51*z +3.03*(z.^2)/(1+z.^2);
[xx1,yy1]=RK44(g,0,1,0,100);
plot(xx1,yy1);hold on;

g=@(z) 0.203-1.51*z +3.03*(z.^2)/(1+z.^2);
[xx2,yy2]=RK44(g,0,1,0,100);
plot(xx2,yy2);hold on;

g=@(z) 0.204-1.51*z +3.03*(z.^2)/(1+z.^2);
[xx3,yy3]=RK44(g,0,1,0,100);
plot(xx3,yy3);hold on;

display("El valor umbral de s se presume cercano a 0.204");