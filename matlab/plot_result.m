function [ ] = plot_result(y, h, t_f, x0)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
k = size(y,1)/3;

x = y(1:k*2, 1);
x_1c = [x0(1); x(1:2:end)];
x_2c = [x0(2); x(2:2:end)];
uc = [y(k*2+1:end, 1); y(end, 1)];

x_1c = kron(x_1c, [1; 1]);
x_1c = x_1c(1:end-1);
x_2c = kron(x_2c, [1; 1]);
x_2c = x_2c(1:end-1);
uc = kron(uc, [1; 1]);
uc = uc(1:end-1);

x = y(1:k*2, 2);
x_1b = [x0(1); x(1:2:end)];
x_2b = [x0(2); x(2:2:end)];
ub = [y(k*2+1:end, 2); y(end, 2)];

x_1b = kron(x_1b, [1; 1]);
x_1b = x_1b(1:end-1);
x_2b = kron(x_2b, [1; 1]);
x_2b = x_2b(1:end-1);
ub = kron(ub, [1; 1]);
ub = ub(1:end-1);

t = 0:h:t_f;
t = kron(t, [1, 1]);
t = t(2:end);

varargins = {x_1c, x_2c, uc,...
            x_1b, x_2b, ub,...
            '$x_{1c}$', '$x_{2c}$', '$u_c$',...
            '$x_{1b}$', '$x_{2b}$', '$u_b$',...
            '-', '-', '-',...
            '--', '--', '--'};
my_plot(t, '', '', varargins)

end

