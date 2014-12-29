function D = DSSpecDir(f,theta,phi,d,N,c)
nSensors = N;
%% convert to column vectors
f = f(:);
N = (1:N)';
theta = theta(:);

%% align the vectors with their respective dimensions
N = permute(N,[3,2,1]);
f = permute(f,[2,1]);

%% replicate the vectors to facilitate vectorized calculations
N = repmat(N,[size(theta,1),size(f,2),1]);
f = repmat(f,[size(theta,1),1,size(N,3)]);
theta = repmat(theta,[1,size(f,2),size(N,3)]);

%% calculate the directivity pattern
D = (1/nSensors)*sum(exp(1i*2*pi*d*f.*(N - 1).*(cos(theta) - cos(phi))/c), 3);
end