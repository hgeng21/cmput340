clc
clear

%% read image
I = imread('tumorContour.jpg'); [y0,x0]= find(I > 250);

%[xgsize,~]=size(x0);
img = imread('tumor.jpg');


%% get data points
figure,imagesc(img),colormap(gray),axis image,hold on
[x,y]=ginput(14);
NEW_X = [];
NEW_Y = [];


disp([x,y]);
%plot(x,y,'ro');

num_pt = 14;
% make circle
x(num_pt+1)=x(1);
y(num_pt+1)=y(1);


%% put the points into sections so that we can draw curves by section
% initialize section list
origin = 1;
section = [1];
cut = (x(1)<x(2));
disp(cut);

temp_x = [];
temp_y = [];

for i = 2:num_pt
    %disp('i = ');disp(i);
    if cut == false
        section = [i,section];
        if x(i)<x(i+1)
            
            cut = true;
            origin = i;
            % do operations and draw curve for this section
            %disp(section);
            for j=1:length(section)
                temp_x = [temp_x, x(section(j))];
                temp_y = [temp_y, y(section(j))];
            end
            disp('temp x: '); disp(temp_x);
            disp('section: '); disp(section);
            
            n = length(temp_x);
            %p = polyfit(temp_x,temp_y,length(temp_x));
            new_x = linspace(temp_x(1),temp_x(length(temp_x)));
            %new_y = polyval(p,new_x);
            if length(new_x)>=n+1
                new_y = polynomial_interp(temp_x,temp_y,temp_x,length(temp_x));
                NEW_X = [NEW_X, temp_x];
                NEW_Y = [NEW_Y, new_y];
            else
                new_y = polynomial_interp(temp_x,temp_y,new_x,length(temp_x));
                NEW_X = [NEW_X, new_x];
                NEW_Y = [NEW_Y, new_y];
            end
            %plot(x,y,'ro',new_x,new_y,'b-'); hold on;
            %---
            temp_x = [];
            temp_y = [];
            section = [origin];
        end
    else
        section = [section, i];
        if x(i)>x(i+1)
            cut = false;
            origin = i;
            %
            %disp(section);
            for j=1:length(section)
                temp_x = [temp_x, x(section(j))];
                temp_y = [temp_y, y(section(j))];
            end
            disp('temp x: '); disp(temp_x);
            disp('section: '); disp(section);
            
            n = length(temp_x);
            %p = polyfit(temp_x,temp_y,length(temp_x));
            new_x = linspace(temp_x(1),temp_x(length(temp_x)));
            %new_y = polyval(p,new_x);
            if length(new_x)>=n+1
                new_y = polynomial_interp(temp_x,temp_y,temp_x,length(temp_x));
                NEW_X = [NEW_X, temp_x];
                NEW_Y = [NEW_Y, new_y];
            else
                new_y = polynomial_interp(temp_x,temp_y,new_x,length(temp_x));
                NEW_X = [NEW_X, new_x];
                NEW_Y = [NEW_Y, new_y];
            end
            
            %---
            temp_x = [];
            temp_y = [];
            section = [origin];
        end
    end
end
% 
new_x = linspace(x(1),x(num_pt));
new_y = linspace(y(1),y(num_pt));
NEW_X = [NEW_X,new_x];
NEW_Y = [NEW_Y,new_y];
plot(x,y,'ro',NEW_X,NEW_Y,'b-',x0,y0,'g:'); hold off;



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

