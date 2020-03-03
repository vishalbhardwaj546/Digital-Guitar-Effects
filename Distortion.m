[y, fs] = audioread('lick02.aiff');
soundsc(y,fs);
pause(5);
yy = atan(4*y);
soundsc(yy,fs);
