function [ y ] = DelaySumBeamform( X, T, W )
%DELAYSUMBEAMFORM Calculate the weighted sum of delayed sensor signals
% Inputs: 
%   X - m x n matrix of m signals whose length is n
%   T - m length array of delays corresponding to the channels in X
%   W - m length array of weights corresponding to the channels in X
% Outputs:
%   y - n length array that is the output of the Delay-Sum Beamformer

Hw = @(w) repmat(W, 1, length(w)).*exp(-1i*repmat(2*pi*T, 1, length(w)));
Xfilt = DiscreteSys(Hw, X, 2^nextpow2(size(X,2)));
y = sum(Xfilt, 1);
end

