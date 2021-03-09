f =100; Ts=1/1000; time=10.0; % freq , sampling interval , time
t=Ts : Ts : time ; % def ine a time vector
w=sin (2* pi* f *t ) ; % define the sinusoid
N=2^10; % size of analysis window
ssf=(-N/2:N/2-1)/(Ts*N) ; % f requency vector
fw=fft (w( 1 :N) ) ; % do DFT/FFT
fws=fftshift(fw) ; % shift it for plot t ing
plot (ssf,abs(fws)) % pl ot magnitude spectrum