% Audio Recording and Playback Demo 
%
% by Krishna Nayak, 19 Nov 2013

%% Record 5 seconds of audio

recObj = audiorecorder(22050, 16, 1);
disp('Start speaking.')
recordblocking(recObj, 5);  
disp('End of Recording.');

% Play it back
play(recObj);

% Extract audio waveform
rec = getaudiodata(recObj);

%% Load from File
%[y fs] = audioread('panjabi.mp4',[1 5e4]);
[y fs] = audioread('narasinh.mp4');
sound(y,fs);
rec = y(:,1);

%% Plot the waveform and its Spectrogram
subplot(1,2,1);
plot(rec);
subplot(1,2,2); 
specgram(rec);