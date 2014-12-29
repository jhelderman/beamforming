function Tau = DSBFDelays(N,d,phi,c)
n = (1:N)';
Tau = (n - 1)*d*cos(phi)/c;
end