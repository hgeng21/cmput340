clc
clear

load sincos_basis

B2=[2*B(:,1).*B(:,2) ones(size(B,1),1)-2*B(:,1).^2];
Y2=[ones(1,size(Y,2))-2*Y(2,:).^2; 
    2*Y(1,:).*Y(2,:)];



for i=1:64
    % get new image1
    img = renderim(Y(:,i),B,imsize); 
    subplot(1,3,1),imshow(img,[]);
    % get new image2
    img = renderim(Y(:,i),B2,imsize); 
    subplot(1,3,2),imshow(img,[]);
    % get new image3
    img = renderim(Y2(:,i),B,imsize); 
    subplot(1,3,3),imshow(img,[]);
    % plot
    drawnow; 
end


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
