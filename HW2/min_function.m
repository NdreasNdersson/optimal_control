function f = min_function(x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global N P

H = eye(3*N);
H(N*2-1:N*2, N*2-1:N*2) = P;

f = x'*H*x;

end

