function D = FSDirPat(filter,f,theta,d,N,c)
%% convert to column vectors
f = f(:);
theta = theta(:);
N = (1:N)';

%% allign the vectors with their respective dimensions
f = permute(f,[2,1]);
N = permute(N,[3,2,1]);

%% replicate the vectors to facillitate vectorized operations
wts = filter(f);
theta = repmat(theta,[1,size(wts,2),size(N,3)]);
wts = repmat(wts,[size(theta,1),1,size(N,3)]);
N = repmat(N,[size(theta,1),size(wts,2),1]);

%% calculate directional pattern
D = sum(exp(1i*2*pi*cos(theta).*(N - 1)*d/c).*wts, 3);

end