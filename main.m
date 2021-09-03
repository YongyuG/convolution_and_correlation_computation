clear all;clc;close all;

%%%% you can set arry a and arry b in different value, try some trails
a = [1 2 1 2 1 ];  
b = [2 2 3 3 3];

%compute convolution
res = my_conv(a,b);
c = conv(a, b);
d = xcorr(a, b);
e = my_conv_usingfft(a, b);


b = flip(b);
%compute corss correlation
f = my_conv_usingfft(a,b);
g = my_conv(a, b);

%%%
%%% Check the results of my function with official function
%%% Check if c = e = res for convolution computation
%%% Check if d = f = g
%%%




