
[x,Fs] = audioread('Singing.wav');  
sound(x,Fs);  
pause(7);  
delay = 0.5;  
gain = 0.35; 
D = floor(delay*Fs);
y = zeros(size(x));  
y(1:D) = x(1:D);  
  
for i=(D+1):length(x)  
  y(i) = x(i) + gain*x(i-D);  
end    
 
sound(y,Fs);
