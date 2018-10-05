% Takes DFT of position-time into frequency space 

[~,a]=distn(tdata);                % average time increment
x = xdata - xm*ones(size(xdata));  % subtract mean
 
x = [x zeros(1,2^15-length(x))];
fs = 1/a;                          % sampling rate
 
X = abs(fft(x));
nfft = length(X);
 
f = fs/2*(0:2/nfft:1-2/nfft);
Xmag = Xmag(1:length(f));

plot(f,Xmag)