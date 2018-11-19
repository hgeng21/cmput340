clc
clear

%% define variables
m = 3;    
X = 0:0.5:m*pi;  
Y = sin(X);

%%
% use n from 1 to 13 for better result, if n gets bigger there're warnings
for n = 1:13
    disp('--- n = ');disp(n);
    % if length(X) > n+1 then fit an approximate polynomial to the points 
    % in the least squares sense.
    if length(X) > n+1
        Y2 = polynomial_interp(X,Y,X,n);
        errX = sqrt( sum( (Y2-Y).^2 ) );
        disp('Error between the interpolated y value and the ground-truth on X: '); disp(errX);
    end
    
    X_new = (0:0.1:2^(1/n)*m*pi);
    Y_new = polynomial_interp(X,Y,X_new,n);
    errX_new = sqrt( sum( (sin(X_new)-Y_new).^2 ) );
    disp('Error between the interpolated y and the ground-truth on X_new: '); disp(errX_new);
    
    figure
    plot(X_new,sin(X_new),'m:',X_new,Y_new,'-');
    
end


%% self-defined function
function Y_new=polynomial_interp(X,Y,X_new,n)
    % here X = [0    0.5000    1.0000    1.5000    2.0000    2.5000    3.0000    3.5000    4.0000    4.5000    5.0000    5.5000    6.0000    6.5000    7.0000    7.5000    8.0000    8.5000    9.0000]
    [~,m] = size(X);    % m = 19
    A = zeros(m, n);    % A = zero matrix, m rows, n columns
    for i = 1:n     % for every column in matrix A
        for j = 1:m     % for every row in matrix A
            A(j,i) = X(j).^(i-1);   % element A(j,i) = element X(j) to the power of (i-1)
        end
    end
    
    x = A\(Y');
    
    
    [~,m2] = size(X_new);
    A2 = zeros(m2,n);
    for i = 1:n 
        for j = 1:m2
            A2(j,i) = X_new(j).^(i-1);
        end
    end
        
    Y_new = (A2*x)';

end
