function [H] = gen_H(h, N, alpha)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
% H-matrix
for i = 1:2:2*N
    H(i:i+1, i:i+1) = eye(2)*h;
end
for i = size(H,1)+1:size(H,1)+N
    H(i, i) = alpha*h;
end

end

