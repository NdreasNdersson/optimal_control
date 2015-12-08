function [A_eq, b_eq] = gen_eq(A_D, B_D, N, x0)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
for i = 1:2:2*N
    A_eq(i:i+1, i:i+1) = eye(2);
end
for i = 1:2:2*N
    A_eq(i+2:i+3, i:i+1) = -A_D;
end
A_eq = A_eq(1:end-2, :);
for i = 1:N
    A_eq(i*2-1:i*2, i+2*N) = -B_D;
end

b_eq = zeros(2*N, 1);
b_eq(1:2) = A_D*x0;

end

