f =100; Ts=1/1000; time=5.0; % f req , sampling inte rval , time
t=Ts : Ts : time ; % def ine a time vector
w=sin (2* pi* f *t ) ; % de f ine the s inuso id
N=2^10; % s i z e of anal y s i s window
fw=abs( fft(w(1:N) ) ) ; % f ind magnitude of DFT/FFT
plot ( fw) % plot the waveform