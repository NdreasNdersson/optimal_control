
clearvars
clc

t_f = 5;
alpha = 0.2;
N = 50;
x0 = [1 -2]';
h = t_f/N;

A = [0 -1; -1 2];
B = [0; 1];

y = zeros(3*N, 2);

for i = 1:2
    if i == 1
        A_D = A*h + eye(2);
        B_D = B*h;
    else
        A_D = expm(A*h);
        fun =@(tau) expm(A*tau)*B;
        B_D = integral(fun, 0, h, 'ArrayValued', true);
    end
    H = gen_H(h, N, alpha);

    % f-vector
    f = zeros(3*N, 1);

    % eq-matrices
    [A_eq, b_eq] = gen_eq(A_D, B_D, N, x0);

    y(:,i) = quadprog(H, f, [], [], A_eq, b_eq);

end
% plot
plot_result(y, h, t_f, x0)


%%
t = 0:h:t_f;

k = size(y,1)/3;
u = [y(k*2+1:end, 2); y(end, 2)];

C = eye(2);
D = 0;
sys = ss(A, B, C, D);
yc = lsim(sys, u, t, x0, 'zoh');

%%
varargins = {yc(:,1), yc(:,2),...
            '$x_{1}$', '$x_{2}$',...
            '-', '-'};
my_plot(t, '', '', varargins) 

%%
x = y(1:k*2, 2);
x_1b = [x0(1); x(1:2:end)];
x_2b = [x0(2); x(2:2:end)];

e_1 = zeros(length(x_1b), 1);
e_2 = zeros(length(x_1b), 1);
for i = 1:length(x_1b)
    e_1(i) = yc(i,1) - x_1b(i)
    e_2(i) = yc(i,2) - x_2b(i);
end
varargins = {e_1, e_2,...
            '$e_{x_{1}}$', '$e_{x_{2}}$',...
            '-', '-'};
my_plot(t, '', '', varargins) 

%% KKT-plot

t = 0:h:t_f;
k = size(y,1)/3;

x = y(1:k*2);
x_1b = [x0(1); x(1:2:end)];
x_2b = [x0(2); x(2:2:end)];

kkt = [H A_eq';A_eq zeros(2*N,2*N)];
opt_kkt = inv(kkt)*[zeros(3*N,1);b_eq];

x1_kkt = [x0(1); opt_kkt(1:2:2*N)];
x2_kkt = [x0(2); opt_kkt(2:2:2*N)];

varargins = {x_1b, x_2b, x1_kkt, x2_kkt,...
            '$x_{1_{QP}}$', '$x_{2_{QP}}$',...
            '$x_{1_{KKT}}$', '$x_{2_{KKT}}$',...
            '-', '-', '--', '--'};
my_plot(t, '', '', varargins) 


