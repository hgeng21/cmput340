clc
clear

xk=10;
r=[xk];
for i=1:20
  xk1=xk-(4*(xk/2+50/xk)*(atan(xk/10))-20.002)/((2-200/xk^2)*(atan(xk/10))+20/xk);
  xk=xk1;
  r=[r xk];
end