clc; clear; close all;

%% parameters
f = 100; % tone frequency
A = 1; % tone amplitude
nSensors = 2; % # of sensors in the ULA
d = 0.8; % distance between ULA elements
c = 340.29; % speed of sound in air
lam = c/f; % wavelength
N = 2048; % # of samples
Fs = f*50; % sampling frequency
tEnd = N/Fs; % simulation end time
% phi = 50*pi/180; % angle of sensitivity
phi = 0;

%% generate signal
t = linspace(0,tEnd,N);
X = sin(2*pi*f*t);
X = repmat(X,nSensors,1);

%% calculate weights
Wts = DSBFWeights(nSensors); % weights

%% calculate delays
Tau = DSBFDelays(nSensors,d,phi,c);

%% beamforming calculation
y = DelaySumBeamform(X,Tau,Wts);

%% plot results
% figure;
% plot(repmat(t,size(X,1),1)',X');
% 
% figure;
% plot(t,y);

%% calculate directivity pattern
F = logspace(0,5,2e3);
theta = linspace(-pi,pi,2e3);
DirPat = DSSpecDir(F,theta,phi,d,nSensors,c);

%% plot the directivity pattern
figure;
hDir = surf(F,180/pi*theta,abs(DirPat));
set(get(hDir,'Parent'),'XScale','log');
set(hDir,'LineStyle','none');
view([0,90]);
xlabel('Frequency(Hz)'); ylabel('Source Angle (degrees)'); zlabel('Magnitude');
colorbar;