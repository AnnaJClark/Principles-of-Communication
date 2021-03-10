%Problem 7.5
%Part a)
f = [200 300 450 550 600 800 2200]; Ts=1/1000; time=10.0; % freq , sampling interval , time
t=Ts : Ts : time ;          % def ine a time vector

tiledlayout(7,1)
for i=1:7
w=sin(2* pi* f(i) *t) ;     % define the sinusoid
N=2^10;                     % size of analysis window
ssf=(-N/2:N/2-1)/(Ts*N) ;   % f requency vector
fw=fft (w( 1 :N) ) ;        % do DFT/FFT
fws=fftshift(fw) ;          % shift it for plot t ing
nexttile
plot (ssf,abs(fws))         % plot magnitude spectrum
end
%It seems to track f until f=450, and is at the greatest magnitude at f=450
%and f = 550. After this, it drops back down gradually to a magnitude 200.

%Part b)
f = 200; Ts=[1/1000 1/500 1/250 1/50]; time=25.0; % freq , sampling interval , time
figure
tiledlayout(4,1)
for i=1:4
t=Ts(i) : Ts(i) : time ;          % define a time vector
w=sin(2* pi* f *t) ;     % define the sinusoid
N=2^10;                     % size of analysis window
ssf=(-N/2:N/2-1)/(Ts(i)*N) ;   % f requency vector
fw=fft(w( 1:N) ) ;        % do DFT/FFT
fws=fftshift(fw) ;          % shift it for plot t ing
nexttile
plot (ssf,abs(fws))         % plot magnitude spectrum
end

%Part c)
f = 200; Ts=1/1000; time=2500.0; % freq , sampling interval , time
t=Ts : Ts : time ;          % define a time vector
w=sin(2* pi* f *t) ;     % define the sinusoid
N=[2^10 2^11 2^14 2^8 2^4 2^2 2^20];                     % size of analysis window
figure
tiledlayout(7,1)
for i=1:7
ssf=(-N(i)/2:N(i)/2-1)/(Ts*N(i)) ;   % f requency vector
fw=fft(w( 1:N(i)) ) ;        % do DFT/FFT
fws=fftshift(fw) ;          % shift it for plot t ing
nexttile
plot (ssf,abs(fws))         % plot magnitude spectrum
end
%As N gets smaller, the width of the peak grows wider

%Exercise 7.6
f = 200; Ts=1/1000; time=10.0; % freq , sampling interval , time
t=Ts : Ts : time ; % def ine a time vector
w=sin(2*pi*f*t).^14250; % define the sinusoid
N=2^10;                     % size of analysis window
ssf=(-N/2:N/2-1)/(Ts*N) ;        % f requency vector
fw=fft (w( 1 :N) ) ;        % do DFT/FFT
fws=fftshift(fw) ; % shift it for plotting
figure
   plot (ssf,abs(fws)) % plot magnitude spectrum
%The magnitude of the spectrum grows significantly smaller as k gets
%larger. k = 14250 is the highest k for which the results make sense.

%Exercise 7.7
f = 200; Ts=1/1000; time=10.0; % freq , sampling interval , time
t=Ts : Ts : time ;          % def ine a time vector
w=sinc(2* pi* f*t ) ;       % define the sinusoid
N=2^10;                     % size of analysis window
ssf=(-N/2:N/2-1)/(Ts*N) ;        % f requency vector
fw=fft (w( 1 :N) ) ;        % do DFT/FFT
fws=fftshift(fw) ;          % shift it for plot t ing
figure
plot (ssf,abs(fws))         % plot magnitude spectrum
%The spectrum of the sinc function was significantly different, with the
%magnitude of the peaks only at 0.9 and the peaks being located at 400.

%Exercise 7.8
f = 200; Ts=1/1000; time=10.0; % freq , sampling interval , time
t=Ts : Ts : time ;          % def ine a time vector
w=sin(t)+j*exp(-t);       % define the sinusoid
N=2^10;                     % size of analysis window
ssf=(-N/2:N/2-1)/(Ts*N) ;        % f requency vector
fw=fft (w( 1 :N) ) ;        % do DFT/FFT
fws=fftshift(fw) ;          % shift it for plot t ing
figure
plot (ssf,abs(fws))

%Because of symmetry, the teqnique in specsin2 works better, as you can see
%the peak at 0 on both sides, giving you a better idea of it.

%Exercise 7.9
%Part a)
figure
f = 200; Ts=1/1000; time=10.0; % freq , sampling interval , time
t=Ts : Ts : time ; % def ine a time vector
phi = [0 0.2 0.4 0.8 1.5 3.14];
tiledlayout(6,1)
for(i=1:6)
w=sin(2*pi*f*t+phi(i)); % define the sinusoid
N=2^10;                     % size of analysis window
ssf=(-N/2:N/2-1)/(Ts*N) ;        % f requency vector
fw=fft (w( 1 :N) ) ;        % do DFT/FFT
fws=fftshift(fw) ; % shift it for plotting
nexttile
plot (ssf,angle(fws)) % plot magnitude spectrum
end

%Part b)
figure
f = 200; Ts=1/1000; time=10.0; % freq , sampling interval , time
t=Ts : Ts : time ; % def ine a time vector
phi = [0 0.2 0.4 0.8 1.5 3.14];
tiledlayout(6,1)
for(i=1:6)
w=sin(2*pi*f*t+phi(i)).^2; % define the sinusoid
N=2^10;                     % size of analysis window
ssf=(-N/2:N/2-1)/(Ts*N) ;        % f requency vector
fw=fft (w( 1 :N) ) ;        % do DFT/FFT
fws=fftshift(fw) ; % shift it for plotting
nexttile
plot (ssf,angle(fws)) % plot magnitude spectrum
end

%Exercise 7.10
figure
filename='gong.wav';    % name of wavefile
[x,sr]=audioread(filename); % read in wavefile
Ts=1/sr ; % sample interval & # of samples
N=2^16; x=x(1:N)'; % length for analysis
sound(x,1/Ts ) % play sound ( if possible )
time=Ts*(0:length(x)-1); % time base for plotting
subplot(2,1,1),plot(time,x) % and plot top figure
magx=abs(fft(x)); % take FFT magni tude
ssf =(0:N/2-1)/(Ts*N) ; % freq base for plotting
subplot(2,1,2),plot(ssf,magx(1:N/2)) % plot mag spectrum

%When using N=2^16, it is clear that the magnitude is much greater during
%the first 0.1s, and becomes smaller during 0.1s segments in the middle of
%the sound. N=2^16 best shows the sound.

%Exercise 7.11
figure
filename='gong.wav';    % name of wavefile
[x,sr]=audioread(filename); % read in wavefile
Ts=1/sr ; % sample interval & # of samples
N=2^16; x=x(1:N)'; % length for analysis
sound(x,1/Ts ) % play sound ( if possible )
time=Ts*(0:length(x)-1); % time base for plotting
subplot(2,1,1),semilogy(time,x) % and plot top figure
magx=abs(fft(x)); % take FFT magnitude
ssf =(0:N/2-1)/(Ts*N) ; % freq base for plotting
subplot(2,1,2),semilogy(ssf,magx(1:N/2)) % plot mag spectrum

%Plotting on a log scale showed the FFT mag spectrum much more clearly. It
%allows us to also clearly see the frequency peaks at smaller amplitudes
%later during the sound

%Exercise 7.12
%Different N
figure
filename='gong2.wav';    % name of wavefile
[x,sr]=audioread(filename); % read in wavefile
Ts=1/sr ; % sample interval & # of samples
N = 2^18; % length for analysis
x=x(1:N)';
sound(x,1/Ts ) % play sound ( if possible )
time=Ts*(0:length(x)-1); % time base for plotting
subplot(8,1,1),semilogy(time,x) % and plot top figure
magx=abs(fft(x)); % take FFT magnitude
ssf =(0:N/2-1)/(Ts*N) ; % freq base for plotting
subplot(8,1,2),semilogy(ssf,magx(1:N/2)) % plot mag spectrum

N = 2^16;
x=x(1:N)';
time=Ts*(0:length(x)-1);
subplot(8,1,3),semilogy(time,x) % and plot top figure
magx=abs(fft(x)); % take FFT magnitude
ssf =(0:N/2-1)/(Ts*N) ; % freq base for plotting
subplot(8,1,4),semilogy(ssf,magx(1:N/2)) % plot mag spectrum

N = 2^14;
x=x(1:N)';
time=Ts*(0:length(x)-1);
subplot(8,1,5),semilogy(time,x) % and plot top figure
magx=abs(fft(x)); % take FFT magnitude
ssf =(0:N/2-1)/(Ts*N) ; % freq base for plotting
subplot(8,1,6),semilogy(ssf,magx(1:N/2)) % plot mag spectrum

N = 2^12;
x=x(1:N)';
time=Ts*(0:length(x)-1);
subplot(8,1,7),semilogy(time,x) % and plot top figure
magx=abs(fft(x)); % take FFT magnitude
ssf =(0:N/2-1)/(Ts*N) ; % freq base for plotting
subplot(8,1,8),semilogy(ssf,magx(1:N/2)) % plot mag spectrum

%Exercise 7.13
filename='268630__dchapiro__v.wav';    % name of wavefile
[x,sr]=audioread(filename); % read in wavefile
Ts=1/sr ; % sample interval & # of samples
N=2^16; x=x(1:N)'; % length for analysis
sound(x,1/Ts ) % play sound ( if possible )
time=Ts*(0:length(x)-1); % time base for plotting
subplot(4,1,1),plot(time,x) % and plot top figure
magx=abs(fft(x)); % take FFT magni tude
ssf =(0:N/2-1)/(Ts*N) ; % freq base for plotting
subplot(4,1,2),plot(ssf,magx(1:N/2)) % plot mag spectrum


Ts=5/sr ; % sample interval & # of samples
N=2^16; x=x(1:N)'; % length for analysis
sound(x,1/Ts ) % play sound ( if possible )
time=Ts*(0:length(x)-1); % time base for plotting
subplot(4,1,3),plot(time,x) % and plot top figure
magx=abs(fft(x)); % take FFT magni tude
ssf =(0:N/2-1)/(Ts*N) ; % freq base for plotting
subplot(4,1,4),plot(ssf,magx(1:N/2)) % plot mag spectrum


%Exercise 7.15
%FIR Filter
a = 0.9; b = 2;
h = [b b*a b*a^2 b*a^3 b*a^4 b*a^5 b*a^6 b*a^7 b*a^8 b*a^9]
x = randn(1,20);
FFTresult=filter(h,1,x);

%IIR Filter
a = 0.9; b = 2;
IIRresult=filter(b,a,h)