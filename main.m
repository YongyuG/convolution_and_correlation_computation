clear all;clc;close all;

%%%% you can set arry a and arry b in different value, try some trails
a = [1 2 8 8];  
b = [2 2 33 0 12 2];

%compute convolution
res = my_conv(a,b); %or my_conv(a,b, 'conv')
c = conv(a, b);
e = my_conv_usingfft(a, b);%or my_conv(a,b, 'conv')
% 
% %compute corss correlation
d = xcorr(a, b);
b = flip(b);
f = my_conv_usingfft(a,b, 'corr');
g = my_conv(a, b, 'corr');

%%%
%%% Check the results of my function with official function
%%% Check if c = e = res for convolution computation
%%% Check if d = f = g for cross-correlation
%%%




