filename='gong.wav';    % name of wavefile
[x,sr]=wavread(filename); % read in wavefile
Ts=1/sr ; % sample interval & # of samples
N=2^15; x=x(1:N)'; % length for analysis
sound(x,1/Ts ) % play sound ( if possible )
time=Ts*(0:length(x)-1); % time base for plotting
subplot(2,1,1),plot(time,x) % and plot top figure
magx=abs(fft(x)); % take FFT magni tude
ssf =(0:N/2-1)/(Ts*N) ; % freq base for plotting
subplot(2,1,2),plot(ssf,magx(1:N/2)) % plot mag spectrum