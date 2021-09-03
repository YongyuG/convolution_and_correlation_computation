clear all;clc;close all;
farend_speech_path = '/home/yongyug/data/aec_challenge/datasets/synthetic/farend_speech/farend_speech_fileid_8109.wav';
nearend_mic_path = '/home/yongyug/data/aec_challenge/datasets/synthetic/nearend_mic_signal/nearend_mic_fileid_8109.wav';

[farend_speech_data, fs] = audioread(farend_speech_path);
[nearend_mic_data, fs] = audioread(nearend_mic_path);

e_idx = min(size(farend_speech_data, 1), size(nearend_mic_data, 1));
[cofs, lags] = xcorr(farend_speech_data, nearend_mic_data, 'coeff');
[val, idx] = max(cofs);
offset = lags(idx);
minlength = length(farend_speech_data) - abs(offset);
disp(offset);
plot(lags,cofs);
xlabel('shift');ylabel('relative cof');

if offset>0
    farend_speech_data = [farend_speech_data(offset:160000); zeros(offset, 1)];
    nearend_mic_data = nearend_mic_data(1:160000);
else
    nearend_mic_data = [nearend_mic_data(-offset:160000) ;zeros(-offset, 1)];
    farend_speech_data = farend_speech_data(1:160000);
end

audiowrite('/home/yongyug/data/8109_far.wav', farend_speech_data, 16000);
audiowrite('/home/yongyug/data/8109_mic.wav', nearend_mic_data, 16000);
