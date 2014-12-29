function [ y ] = DiscreteSys( Hw, x, n )
% implements y = conv(hz,x) using fast convolution
% Inputs:
%   Hz: anonymous function representing the z-transform of the impulse
%       response
%    x: signal
%    n: number of points on which to perform the dft
% Outputs:
%    y: system applied to the signal
X = fft(x,n,2);
H = Hw(linspace(0,0.5*(1 - 1/n),n));
y = ifft(X.*H,n,2);
end

