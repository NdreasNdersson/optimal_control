function [c, ceq] = quad_con(z)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
global N P

T = zeros(3*N);
T(N*2-1:N*2, N*2-1:N*2) = P;

%d = zeros(3*N, 1);
%d(N*2-1:N*2) = [1.3325, 1.3325]';
d = 1.3325;

c = z'*T*z - d;
ceq = [];

end

