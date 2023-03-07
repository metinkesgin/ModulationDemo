Fs = 1000;
fm = 5;
fc = 100;
t = 0:1/Fs:1;
m = 1;
B = 10;

%Signals
messageSignal = cos(2*pi*fm*t);
carrierSignal = cos(2*pi*fc*t);
%Amplitude Modulation
AMSignal = (1+m*messageSignal).*carrierSignal;
%Frequency Modulation
FMSignal = cos(2*pi*fc*t+B*messageSignal);

%Fast Fourier Transform
AMSignalFFT = fft(AMSignal);
AMSignalFFTLength = length(AMSignalFFT);
AMP1 = abs(AMSignalFFT/AMSignalFFTLength);
AMP2 = P1(1:AMSignalFFTLength/2+1);
AMF = Fs*(0:(AMSignalFFTLength/2))/AMSignalFFTLength;

FMSignalFFT = fft(FMSignal);
FMSignalFFTLength = length(FMSignalFFT);
FMP1 = abs(FMSignalFFT/FMSignalFFTLength);
FMP2 = P1(1:FMSignalFFTLength/2+1);
FMF = Fs*(0:(FMSignalFFTLength/2))/FMSignalFFTLength;

subplot(6,1,1);
plot(t,messageSignal);
xlabel("Message Signal");
subplot(6,1,2);
plot(t,carrierSignal);
xlabel("Carrier Signal");
subplot(6,1,3);
plot(t,AMSignal);
xlabel("AM Signal");
subplot(6,1,4);
plot(t,FMSignal);
xlabel("FM Signal");
subplot(6,1,5);
plot(AMF,AMP2);
xlabel("AM FFT");
subplot(6,1,6);
plot(FMF,FMP2);
xlabel("FM FFT");