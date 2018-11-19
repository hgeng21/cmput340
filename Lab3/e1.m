clc
clear


load EllipsePoints

%% fig 1
figure(1),plot(Y1(1,:),Y1(2,:),'.'),axis equal, hold on
% center the data
t1=mean(Y1,2);
Yn1=Y1-t1*ones(1,size(Y1,2));
% compute the empirical covariance matrix
C1=(Yn1*Yn1')/size(Y1,2);
% get eigenvectors and values
[X1,D1]=eig(C1);
% plot
hold on
plot([t1(1) 2*sqrt(D1(1,1))*X1(1,1)+t1(1)],[t1(2) 2*sqrt(D1(1,1))*X1(2,1)+t1(2)],'r')
plot([t1(1) 2*sqrt(D1(2,2))*X1(1,2)+t1(1)],[t1(2) 2*sqrt(D1(2,2))*X1(2,2)+t1(2)],'g')
hold off

%% fig2
figure(2),plot(Y2(1,:),Y2(2,:),'.'),axis equal
% center the data
t2=mean(Y2,2);
Yn2=Y2-t2*ones(1,size(Y2,2));
% compute the empirical covariance matrix
C2=(Yn2*Yn2')/size(Y2,2);
% get eigenvectors and values
[X2,D2]=eig(C2);
% plot
hold on
plot([t2(1) 2*sqrt(D2(1,1))*X2(1,1)+t2(1)],[t2(2) 2*sqrt(D2(1,1))*X2(2,1)+t2(2)],'r')
plot([t2(1) 2*sqrt(D2(2,2))*X2(1,2)+t2(1)],[t2(2) 2*sqrt(D2(2,2))*X2(2,2)+t2(2)],'g')
hold off

%% fig3
figure(3),plot(Y3(1,:),Y3(2,:),'.'),axis equal, hold off
% center the data
t3=mean(Y3,2);
Yn3=Y3-t3*ones(1,size(Y3,2));
% compute the empirical covariance matrix
C3=(Yn3*Yn3')/size(Y3,2);
% get eigenvectors and values
[X3,D3]=eig(C3);
% plot
hold on
plot([t3(1) 2*sqrt(D3(1,1))*X3(1,1)+t3(1)],[t3(2) 2*sqrt(D3(1,1))*X3(2,1)+t3(2)],'r')
plot([t3(1) 2*sqrt(D3(2,2))*X3(1,2)+t3(1)],[t3(2) 2*sqrt(D3(2,2))*X3(2,2)+t3(2)],'g')
hold off
