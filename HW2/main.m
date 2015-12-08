clearvars
clc
global N P

M = 30;
N = 3;
P = [4.2, 7; 7, 36.1];

A_D = [1, 3; -0.5, 1];
B_D = [0, 1]';

x00 = [0.6, -0.7]';
%x00 = [1, -0.9]';

A_eq = gen_eq(A_D, B_D, x00);

A_in(1:N, 3*N-2:3*N) = eye(3);
A_in(N+1:N+3, 3*N-2:3*N) = -eye(3);

b_in = ones(6,1);

save_z = [];
h = waitbar(0,'fmincon running...');
options = optimoptions('fmincon', 'MaxFunEvals', 10000, 'Display', 'notify');
x0 = x00;
for i = 1:M
    
    b_eq = zeros(2*N, 1);
    b_eq(1:2) = A_D*x0;
    z = fmincon(@min_function,...
                ones(3*N,1),...
                A_in, b_in,...
                A_eq, b_eq,...
                [], [],...
                @quad_con,...
                options);
    save_z = [save_z, z];
    x0 = z(1:2);
    waitbar(i / M)
end
close(h)

k = 0:M;
figure(1)
stairs(k, [x00(1), save_z(1,:)])
hold on
stairs(k, [x00(2), save_z(2,:)])
figure(2)
stairs(k, [save_z(N*2+1,:), save_z(N*2+1,end)])

%% g)
H = eye(2);
R = 1;
F = 0;
[K,S,E] = dlqr(A_D, B_D, H, R, F);
