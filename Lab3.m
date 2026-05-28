% Question 1
% a)
% init
h = 0.5;
X = 3;
N = round(X / h);
t1 = zeros(1, N + 1); T1 = zeros(1, N + 1);
t1(1) = 0; T1(1) = 30;

% main
for n = 1:N
    t1(n + 1) = t1(n) + h;
    T1(n + 1) = T1(n) + h * -13 / 10 * (T1(n) - 21);
end
T1(N + 1) % 21.0165


% b)
% init
h = 0.2;
X = 3;
N = round(X / h);
t2 = zeros(1, N + 1); T2 = zeros(1, N + 1);
t2(1) = 0; T2(1) = 30;

% main
for n = 1:N
    t2(n + 1) = t2(n) + h;
    T2(n + 1) = T2(n) + h * -13 / 10 * (T2(n) - 21);
end
T2(N + 1) % 21.0983

% Question 2
% 
% T(t) = 9 * e ^ (-13 * t / 10) + 21

% Question 3
% init
error = 100;
N = 15;
X = 3;
while error > 0.04823
    N = N + 1;

    T_exact = @(t) (9 * exp(-13 * t / 10) + 21);

    h = X / N;
    t3 = zeros(1, N + 1); T_approx = zeros(1, N + 1);
    t3(1) = 0; T_approx(1) = 30;

    % main
    for n = 1:N
        t3(n + 1) = t3(n) + h;
        T_approx(n + 1) = T_approx(n) + h * -13 / 10 * (T_approx(n) - 21);
    end

    abs_error = abs(T_exact(t3) - T_approx);
    error = max(abs_error);
end
N % 136

% Question 4
% init
X = 5;
N = 136;
h = X / N;
t4 = zeros(1, N + 1); T4 = zeros(1, N + 1);
t4(1) = 0; T4(1) = 30;
g4 = @(t) (21 + 10 * sin(10./(t.^2 + 0.5)));

% main
for n = 1:N
    t4(n + 1) = t4(n) + h;
    T4(n + 1) = T4(n) + h * -13 / 10 * (T4(n) - g4(t4(n)));
end 

% plotting
figure(1);
plot(t4,T4,'b', t4,g4(t4),'r');
title('Alexander Perlock : 400619457');
legend('Temperature of Bolt', 'Temperature of Surrounding');
xlabel('t'); ylabel('T');