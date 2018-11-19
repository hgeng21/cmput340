clc
clear

%% Plots
% plot the function
fplot(@(x) sin(10*x)-x, [-1,1]);
%
ax=gca;
ax.XGrid = 'on';
ax.YGrid = 'on';

%% get r
xk=-0.9;
yk=sin(10*xk)-xk;
xs = [xk];
ys = [yk];
for k=1:10
  xk1=xk-(yk)/(10*cos(10*xk)-1);
  xk=xk1;
  xs = [xs xk];
  yk = sin(10*xk)-xk;
  ys = [ys yk];
end

xk
