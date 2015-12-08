function b_eq = fun_b_eq(z)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global A_D

b_eq = zeros(2*N, 1);
b_eq(1:2) = A_D*x0;
end

