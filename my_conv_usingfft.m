function [ c ] = my_conv_usingfft( a ,b )
alen = length(a);
blen = length(b);

a = [a zeros(1, blen-1)];
b = [b zeros(1, alen-1)];

A = fft(a);
B = fft(b);
c = real(ifft(A.*B));


end

