function [ c ] = my_conv_usingfft( a ,b, mode)
aLen = length(a);
bLen = length(b);

if (nargin < 3)
    mode = 'conv';
end
if (mode == 'corr')
    if (aLen > bLen)
        b = [b zeros(1, aLen - bLen)];
        bLen = length(b);
    else
        a = [a zeros(1, bLen - aLen)];
        aLen = length(a);
    end
end

a = [a zeros(1, bLen-1)];
b = [b zeros(1, aLen-1)];

A = fft(a);
B = fft(b);
c = real(ifft(A.*B));


end

