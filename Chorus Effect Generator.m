[x,Fs] = audioread('singing.wav');  
sound(x,Fs);  
pause(6);  
delay = 0.03;   
gain = 0.5;   
D = round(delay*Fs);  
y1 = zeros(size(x));  
y1(1:D) = x(1:D);  
  
for i=(D+1):length(x)  
  y1(i) = x(i) + gain*x(i-D);  
end  
 
delay = 0.035; 
D = round(delay*Fs);   
y2 = zeros(size(y1));
y2(1:D) = y1(1:D);
 
for i=(D+1):length(x)  
  y2(i) = y1(i) + gain*x(i-D);  
end  
 
delay = 0.04; 
D = round(delay*Fs);  
y3 = zeros(size(y2));  
y3(1:D) = y2(1:D);  
   
for i=(D+1):length(x)  
  y3(i) = y2(i) + gain*x(i-D);  
end  
 
delay = 0.045; 
D = round(delay*Fs);  
y4 = zeros(size(y3));  
y4(1:D) = y3(1:D);  
   
for i=(D+1):length(x)  
   y4(i) = y3(i) + gain*x(i-D);  
end  
 
sound(y4,Fs);
