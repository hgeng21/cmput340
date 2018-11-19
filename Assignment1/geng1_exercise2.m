% geng1
% 1468074
% cmput 340 Lab assignment1


%A = [1, 2, 3, 4, 0; 0, 0, 0, 2, 3; 0, 0, 0, 2, 1; 0, 0, 0, 0, 0; 0, 0, 0, 0, 0];
%b = [1; 2; 3; 0; 0];


%A2= [1 2 2;4 4 2;4 6 7];
%b2 = [1;2;3];

A = input('A = ');
b = input('b = ');

%[M1,L1] = elimMat(A2,1)
%[M2,L2] = elimMat(M1,2)

% calculate L and U
[L,U] = myLU(A)
% do forward substitution to get y
y = fwdSubst(L,b)
%disp('y = ');disp(y);
% do backward substitution to get x
x = bwdSubst(U,y)
%x2 = U\y



%% function myLU
function[L,U] = myLU(A)
    [x,y] = size(A);
    tempL = zeros(x,y);
    tempU = zeros(x,y);
    [U,L] = elimMat(A,1);
    
    %disp('L1 = ');disp(L);
    %disp('U1 = ');disp(U);
    
    for i = 2:x
        [tempU,tempL] = elimMat(U,i);
        L = L*tempL;
        U = tempU;
        
        %disp('L = ');disp(L);
        %disp('U = ');disp(U);
        
    end
end




%% elimMat function
function [M,L] = elimMat(A,k)
    [x,y] = size(A);
    tempL = eye(x);
    
    for i = 1:x
        if A(k,k) ~= 0
            a = A(i,k) / A(k,k);
            if i > k
                tempL(i,k) = a;
                P = A(k,:) * a;
                A(i,:) = A(i,:) - P;
            end
        end
    end
    M = A;
    L = tempL;
    %M = inv(L);
end




%% forward substitution
function y = fwdSubst(L,b,k)

    [m,n]=size(L);
    if ~exist('k')  % If first call no k param given, but k=1
        k=1;
    end
  
    y=b(k)/L(k,k);
    if k < n % Recursion step
        l = [zeros(k,1);L(k+1:m,k)];
        y = [y;fwdSubst(L,b-y*l,k+1)];
    end
end


%% backward substitution
% unused version of backward substitution
function x = bwdSubst2(U,y,k)
    
    n=length(y);
    if ~exist('k')  % If first call no k param given, but k=1
        k=n;
    end
    
    x(n,1)=y(k)/U(k,k);
    if k > 1 % Recursion step
        u = [zeros(k,1);U(k-1:n,k)];
        x = [x;bwdSubst(U,y-x*u,k-1)];
    end
end



%% backward substitution
function x = bwdSubst(U,y,k)
    
    n=length(y);
    if ~exist('k')  % If first call no k param given, but k=1
        k=n;
    end

    n = length(y);
    
    if U(n,n) == 0
        x(n,1) = 0;
    else
        x(n,1) = y(n) / U(n,n);
    end
    
    for i = n-1:-1:1
        temp = U(i,i+1:n) * x(i+1:n,1);
        if U(i,i) ~= 0
            x(i,1) = (y(i) - temp ) ./ U(i,i);
        end
    end
end


