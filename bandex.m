fbe=[0 0.24 0.26 0.74 0.76 1]; % freq band edges as a fraction of
% the Nyquist f requency
damps=[0 0 1 1 0 0]; % des i r ed amplitudes at band edges
fl=30; % filter size
b=firpm(fl, fbe , damps); % b i s the designed impulse response
figure(1)
freqz(b) % plot f r eq response to check design