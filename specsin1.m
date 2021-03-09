f =100; Ts=1/1000; time =5.0; % f req , sampling inte rval , time
t=Ts : Ts : time ; % def ine a time vector
w=sin(2* pi* f *t ) ; % de f ine the s inuso id
N=2^10; % s i z e of a n a l y s i s window
ssf =(0:N/2-1)/(Ts*N) ; % f requency vector
fw=abs ( fft (w(1:N) ) ) ; % f ind magnitude of DFT/FFT
plot ( ssf , fw( 1:N/2)) % plot for positive freq only