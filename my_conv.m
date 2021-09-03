function [ convRes ] = my_conv(aSignal, bSignal, mode)
aLen= length(aSignal); 
bLen = length(bSignal);
if (nargin < 3)
    mode = 'conv';
end
if (mode == 'corr')
    if (aLen > bLen)
        bSignal = [bSignal zeros(1, aLen - bLen)];
        bLen = length(bSignal);
    else
        aSignal = [aSignal zeros(1, bLen - aLen)];
        aLen = length(aSignal);
    end
end



N = aLen + bLen - 1;           %lenth of convolution results must be aLen + bLen -1

bSignal = [bSignal  zeros(1, aLen - 1)]; 
bSignal = flip(bSignal);%flip the signal

aBuffer = [aSignal zeros(1, bLen - 1)];
bBuffer = zeros(1, length(aBuffer));
convRes = zeros(1, N);

for i = 1: N
    
    bBuffer(:, 2:length(bBuffer)) = bBuffer(:, 1:length(bBuffer)-1);  %shift to the right
    bBuffer(:, 1) = bSignal(:, N-i+1);             %move bsignal from left to right
    convRes(:, i) = aBuffer(:,:) * bBuffer(:, :)'; %compute convolution

end

end

