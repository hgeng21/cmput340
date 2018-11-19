clc
clear

%% Taylor expansion:
% I(u+du,v+dv) = I(u,v) + [Ix(u,v) Iy(u,v)][du dv]' + hot


load immotion_basis
%% draw the given motion
for i=1:13
    img = renderim(Y(:,i),B,imsize); 
    imshow(img,[]);
    drawnow; 
    pause(0.05);
end


%% try another image
% read image cat.jpg and calculate gradient
cat=imread('cat.jpg');
cat=double(rgb2gray(cat));
[cat_x,cat_y]=gradient(cat);
B_cat=[cat(:) cat_x(:) cat_y(:)];
% draw image motion
for i=1:13
    img = renderim(Y(:,i),B_cat,size(cat)); 
    imshow(img,[]);
    drawnow; 
    pause(0.05);
end


%% try a bigger Y
pause();

interval=5:10;
Y_larger=[ones(1,19);                   % all ones
    0 5 6 7 8 9 10 0 0 0 0 0 0  5 6 7 8 9 10;
    0 0 0 0 0 0 0  5 6 7 8 9 10 5 6 7 8 9 10];
% draw the motion
for i=1:13
    img = renderim(Y_larger(:,i),B_cat,size(cat)); 
    imshow(img,[]);
    drawnow; 
    pause(0.05);
end

%% In this case, a smaller Y works better
% when using a bigger Y, the image should shift left, right, then left,
% but instead, it shifts left and right and then stopped.


%% obtained from coursepage
function im_new = renderim(Y_new,B,imsize,NrB)

if(nargin<4)
  NrB = size(B,2);
end

if imsize(1)*imsize(2)~=size(B,1)
  fprintf('Incompatible image size\n');
  return;
end

im_new = reshape(B(:,1:NrB)*Y_new(1:NrB),imsize(1),imsize(2));
end
