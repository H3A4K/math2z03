% Question 1
% Init
X = 5;
h = 0.1;
N = round (X / h);
x1 = zeros(1, 2 * N + 1);
y1 = zeros(1, 2 * N + 1);
x1(1) = 0.5;
y1(1) = 0;
E0 = 0.2;
k1 = 0.3;
kn1 = 0.1;
k2 = 0.4;

% main
% t = (0, 5]
for n = 1:N
    dxdt1 = - k1 * (E0 - y1(n)) * x1(n) + kn1 * y1(n);
    dydt1 = k1 * (E0 - y1(n)) * x1(n) - (kn1 + k2) * y1(n);

    x1(n + 1) = x1(n) + h * dxdt1;
    y1(n + 1) = y1(n) + h * dydt1;
end
x1(N + 1) % t = 5 % 0.4009

% t = (5, 10]
for n = N+1:2*N
    dxdt1 = - k1 * (E0 - y1(n)) * x1(n) + kn1 * y1(n);
    dydt1 = k1 * (E0 - y1(n)) * x1(n) - (kn1 + k2) * y1(n);

    x1(n + 1) = x1(n) + h * dxdt1;
    y1(n + 1) = y1(n) + h * dydt1;
end
x1(2 * N + 1) % t = 10 % 0.3304

% Question 2
% init
X = 5;
h = 0.02;
N = round (X / h);
t = 0:h:5;
x2 = zeros(1, N + 1);
u2 = zeros(1, N + 1);
x2(1) = 10;
u2(1) = 5;
lambda = 2;
omega = 8;

% main
for n = 1:N
    dxdt2 = u2(n);
    dudt2 = -2 * lambda * u2(n) - omega ^ 2 * x2(n);

    x2(n + 1) = x2(n) + h * dxdt2;
    u2(n + 1) = u2(n) + h * dudt2;
end

% plotting
figure(1);
plot(t,x2,'r', t,u2,'g');
title('Alexander Perlock : 400619457');
legend('displacement', 'velocity');
xlabel('t');
saveas(gcf, 'Lab4_2.png');

% Question 3
% init
X = 5;
h = 0.02;
N = round (X / h);
lambda = 2;
omega = 8;

% main
while true
    x3 = zeros(1, N + 1);
    u3 = zeros(1, N + 1);
    x3(1) = 10;
    u3(1) = 5;

    for n = 1:N
        dxdt3 = u3(n);
        dudt3 = -2 * lambda * u3(n) - omega ^ 2 * x3(n);

        x3(n + 1) = x3(n) + h * dxdt3;
        u3(n + 1) = u3(n) + h * dudt3;
    end
    if min(x3(:)) >= 0
        break;
    end
    lambda = lambda + 0.02;
end
lambda % 8

% Question 4
% d2thetaAdt2 = -2 * lambda * dthetaAdt - omega ^ 2 * thetaA
% dthetaAdt = u
% dudt = -2 * lambda * u - omega ^ 2 * thetaA

% d2thetadt2 = -2 * lambda * dthetadt - omega ^ 2 * sin(theta)
% dthetadt = k
% dkdt = -2 * lambda * k - omega ^ 2 * sin(theta)

% init
X = 5;
h = 0.01;
N = round(X / h);
thetaApprox = zeros(1, N + 1); u4 = zeros(1, N + 1);
thetaActual = zeros(1, N + 1); k4 = zeros(1, N + 1);
thetaApprox(1) = 80 / 180 * pi ; u4(1) = 0;
thetaActual(1) = thetaApprox(1); k4(1) = u4(1);
lambda = 1.6;
omega = 4.6;

% main
for n = 1:N
    thetaApprox(n + 1) = thetaApprox(n) + h * u4(n);
    thetaActual(n + 1) = thetaActual(n) + h * k4(n);

    u4(n + 1) = u4(n) + h * (-2 * lambda * u4(n) - omega ^ 2 * thetaApprox(n));
    k4(n + 1) = k4(n) + h * (-2 * lambda * k4(n) - omega ^ 2 * sin(thetaActual(n)));
end

absError = abs(thetaActual - thetaApprox);
maxError = max(absError) % 0.2312

% Question 5 // plotting
t = 0:h:5;
figure(2);
plot(t,thetaApprox,'r:', t,thetaActual,'b-');
title('Alexander Perlock : 400619457');
legend('Approximate', 'Actual');
xlabel('time (t) [s]');
saveas(gcf, 'Lab4_5.png');
