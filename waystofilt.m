h=[1 -1 2 -2 3 -3]; % impulse response h[ k ]
x=[1 2 3 4 5 6 -5 -4 -3 -2 -1]; % input data x [ k ]
yconv=conv(h , x) % convolve x[k]* h [ k ]
yfilt=filter(h , 1 , x) % f i l t e r x [ k ] with h[ k ]
n=length (h)+length (x)-1; % pad l eng th f o r FFT
ffth=fft([h zeros(1,n-length(h))]); % FFT o f h [ k ] i s H[ n ]
fftx=fft([x,zeros(1,n-length(x))]); % FFT of input i s X[ n ]
ffty=ffth.*fftx; % product of H[ n ] and X[ n ]
yfreq=real(ifft(ffty)) % IFFT of product give s y [ k ]
z=[zeros(1,length(h)-1),x] ; % initial filter state=0
for k=1:length(x) % time?domain method
ytim(k)=fliplr(h)*z(k:k+length(h)-1)'; % do f o r each x [ k ]
end