[ x, Fs] = audioread('lick02.aiff');


% lower the damping factor the smaller the passband
damp = 0.2;

% min and max centre cutoff frequency of variable bandpass filter
minf=500;
maxf=3000;

% wah frequency, how many Hz per second are cycled through
Fw = 2000; 

% change in centre frequency per sample (Hz)
delta = Fw/Fs;

% create triangle wave of centre frequency values
Fc=minf:delta:maxf;
while(length(Fc) < length(x) )
    Fc= [ Fc (maxf:-delta:minf) ];
    Fc= [ Fc (minf:delta:maxf) ];
end

% trim tri wave to size of input
Fc = Fc(1:length(x));


% difference equation coefficients
F1 = 2*sin((pi*Fc(1))/Fs);  
Q1 = 2*damp;               


yh=zeros(size(x));          % create emptly out vectors
yb=zeros(size(x));
yl=zeros(size(x));

% first sample, to avoid referencing of negative signals
yh(1) = x(1);
yb(1) = F1*yh(1);
yl(1) = F1*yb(1);


% apply difference equation to the sample; STATE VARIABLE FILTER
for n=2:length(x)
    
    yh(n) = x(n) - yl(n-1) - Q1*yb(n-1);
    yb(n) = F1*yh(n) + yb(n-1);
    yl(n) = F1*yb(n) + yl(n-1);
    
    
    F1 = 2*sin((pi*Fc(n))/Fs);
end

%normalise

maxyb = max(abs(yb));
yb = yb/maxyb;


sound(yb, Fs);
