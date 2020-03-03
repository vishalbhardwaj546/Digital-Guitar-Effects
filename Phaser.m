[x,Fs] = audioread('lick02.aiff');
sound(x,Fs);
pause(8);
lfo_freq = 1;                                        
lfo_min = 200;                                       
lfo_max = 2000;                   


lfo = sawtooth(2*pi*lfo_freq*(1:length(x))/Fs,0.5);   % Generate triangle wave
lfo = 0.5*(lfo_max-lfo_min)*lfo+(lfo_min+lfo_max)/2;  % Shift Triangle wave
y = zeros(1,length(x));


for j=3:length(x);                                    
    [b,a] = iirnotch(2*lfo(j)/Fs,2*lfo(j)/Fs);          
    y(j) = b(1)*x(j)+b(2)*x(j-1)+b(3)*x(j-2) ...      
        -a(2)*y(j-1)-a(3)*y(j-2);
end
x = y;
y = zeros(1,length(x));
for j=3:length(x);                                    
    [b,a] = iirnotch(6*lfo(j)/Fs,6*lfo(j)/Fs);         
    y(j) = b(1)*x(j)+b(2)*x(j-1)+b(3)*x(j-2) ...    
        -a(2)*y(j-1)-a(3)*y(j-2);
end
x = y;
y = zeros(1,length(x));
for j=3:length(x);                                   
    [b,a] = iirnotch(6*lfo(j)/Fs,6*lfo(j)/Fs);          
    y(j) = b(1)*x(j)+b(2)*x(j-1)+b(3)*x(j-2) ...      
        -a(2)*y(j-1)-a(3)*y(j-2);
end
x = y;
y = zeros(1,length(x));
for j=3:length(x);                                    
    [b,a] = iirnotch(6*lfo(j)/Fs,6*lfo(j)/Fs);          
    y(j) = b(1)*x(j)+b(2)*x(j-1)+b(3)*x(j-2) ...       
        -a(2)*y(j-1)-a(3)*y(j-2);
end

sound(y,Fs);
