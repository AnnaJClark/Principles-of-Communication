a=[1 -0.8];lena=length(a)-1; % autor egr es s ive c o e f f i c i e n t s
b=[1];lenb=length(b); % moving average c o e f f i c i e n t s
d=randn(1,20); % data to f ilter
if lena>=lenb, % dimpulse needs lena>=lenb
h=impz(b,a); % impulse response of f i l t e r
yfilt=filter(h,1,d) % f i l t e r x [ k ] with h [ k ]
end
yfilt2=filter(b,a,d) % f i l t e r using a and b
y=zeros(lena,1);x=zeros(lenb,1); % initial states in filter
for k=1:length(d)-lenb % time?domain method
x=[d(k);x(1:lenb-1)]; % past values of inputs
ytim(k)=-a(2: lena+1)*y+b*x; % directly calculate y[k]
y=[ytim(k);y(1:lena -1)]; % past values of outputs
end