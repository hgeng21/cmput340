% Vectorize the following
% Note the use of the tic/toc calls to time execution
% Compare the time once you have vectorized it

tic
for i = 1:1000
    t(i) = 2*i;
    y(i) = sin (t(i));
end
toc

clear;

%The elapsed time is 0.000912 seconds.

%vectorized:

tic
    t = 2:2:1000;
    y = sin (t);
toc

clear;
%The elapsed time is 0.000259 seconds.
%The victorized version is more efficient