% Sample script  that shows how to automate running problem solutions
close all;
clear;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% a) Load an image using the imread command 
I=imread('cat.jpeg');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% b) Display original image in the first spot of a 2 x 3 a grid layout
%    Check the imshow and subplot commands.
fig1 = figure(1);
subplot(2, 3, 1);
imshow(I);
title('Original image');
pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% c) Display a gray scale version of the image in position 2 of the grid.
%    help rgb2gray
figure(1);
subplot(2, 3, 2);
img2=rgb2gray(I);
imshow(img2);
title('Gray scale image');
pause();

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% d) Generate a new figure and ask user to manually select a region of the
%    image. Display the subimage in position 3 of the grid.
%    Hint--> getrect()

% Get user input on a newly dislayed image

% Make grid the current figure

% Display selected region. Note the last : which applies the cut
% over all 3 channels.


img3=figure(2);
imshow(I);
title('Please select a region');

% get coordinate of the cropped region
rect = getrect(img3);
x1 =rect(1);
x2 = rect(3);
y1 =rect(2);
y2 = rect(4);

% crop the old image
new_img = imcrop(I,[y1 x1 x2 y2]);

figure(1);
subplot(2, 3, 3);
imshow(new_img)
title('Cropped image');

pause()

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% e) Create a function J = luminance_change(I, option, value) such that:
%   * When given the option 'c', image I's contrast will be modified by
%     the given value. Simple multiplication will achieve this.
%   * When given the option 'b', image I's brightness will be modified by
%     the given value. Simple addition will achieve this.
%  
%   Showcase your function by filling positions 4 and 5 in the grid

% Contrast change
%%%%%
figure(1);
img4 = luminance_change(I, 'c', [0.4, 0.6]);
subplot(2, 3, 4);
imshow(img4);
title('Reduced contrast');
pause();

% Brightness change
figure(1);
img5 = luminance_change(I, 'notc', 0.15);
subplot(2, 3, 5);
imshow(img5);
title('Increased brightness');

pause();





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% f) BONUS: Display a version of the image after its been blurred using a
%    Gaussian filter. Hint: imgaussfilt()

figure(1);
subplot(2, 3, 6);
img6 = imgaussfilt(I, 5); %set the default sigma = 5
imshow(img6);
title('Gaussian blurr');



%% function J as requested above
function J = luminance_change(I, option, value) 
    if option == 'c'
        J = imadjust(I, [0, 1], value);
    else
        J = imadjust(I, [], [], value);
    end
end