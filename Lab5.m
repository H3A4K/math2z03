% Question 1
% k1 = k2 = k3 = 3.6 .'. k = 3.6
% x1'' = -k * x1 - k * (x1 - x2)
% x2'' = -k * (x2 - x1) - k * x2
% 
% let   v1 = x1' : (1), 
%       v2 = x2' : (2)
% 
% v1' = -k * (x1) - k * (x1 - x2) = -k * (2 * x1 - x2) : (3)
% v2' = -k * (x2 - x1) - k * x2   = -k * (2 * x2 - x1) : (4)

% init
k = 3.6;
h = 0.01;
X = 20;
N = round(X / h);
x1 = zeros(1, N + 1); x2 = zeros(1, N + 1);
v1 = zeros(1, N + 1); v2 = zeros(1, N + 1);
x1(1) = 0; x2(1) = 22;
v1(1) = 0; v2(1) = 0;

% main
for n = 1:N
    x1(n + 1) = x1(n) + h * v1(n); % (1)
    x2(n + 1) = x2(n) + h * v2(n); % (2)

    v1(n + 1) = v1(n) + h * -k * (2 * x1(n) - x2(n)); % (3)
    v2(n + 1) = v2(n) + h * -k * (2 * x2(n) - x1(n)); % (4)

end

max(x2) % 36.2117

% Question 2
%  y' = 9 * x + y : (1)

% init
h = 0.01;
X = 2;
N = round(X / h);
x = zeros(1, N + 1); y = zeros(1, N + 1);
y(1) = 6;

% main
for n = 1:N
    x(n + 1) = x(n) + h;
    dydx     = (9 * x(n) + y(n)); % (1)
    ya       = y(n) + h * dydx;
    y(n + 1) = y(n) + 0.5 * h * (dydx + 9 * x(n + 1) + ya);
end
y(N + 1) % 83.8322

% Question 3
% init
k = 3.6;
h = 0.01;
X = 20;

Y = zeros(4, N + 1);
Y(:, 1) = [0 22 0 0];

F = @(y) [
    y(3) % (1.1)
    y(4) % (1.2)
    -k * (2 * y(1) - y(2)) % (1.3)
    -k * (2 * y(2) - y(1)) % (1.4)
]; 

% main
for n = 1:N
    fn          = F(Y(:, n));
    ya          = Y(:, n) + h * fn;
    Y(:, n + 1) = Y(:, n) + 0.5 * h * (fn + F(ya));
end
max(Y(2, :)) % 22

% Question 4
% plotting
t = linspace(0, 20, N+1);
figure(1);
plot(t, Y(2, :), "r");
legend('Displacement of mass 2');
xlabel('Time'); ylabel('Displacement');
title('Alexander Perlock : 400619457');
saveas(gcf, 'Lab5_4.png');

% Question 5
% x'' = 14 * (x - 5) * exp(-(x-5)^2);
% let v = x' % (1)
% v' = 14 * (x - 5) * exp( -(x - 5) ^ 2) % (2)

% init
h = 0.01;
tf = 50;
N = round(tf / h);

F = @(x) [
    x(2) % (1)
    14 * (x(1) - 5) * exp(- (x(1) - 5) ^ 2) % (2)
];

vmin = 0; vmax = 38;

% main
while vmax - vmin > 0.01
    X = zeros(2, N + 1);
    V = (vmax + vmin) / 2;
    X(:, 1) = [0 V];

    for n = 1:N
        fn = F(X(:, n));
        xa = X(:, n) + h * fn;
        X(:, n + 1) = X(:, n) + 0.5 * h * (fn + F(xa));
    end
    if X(1, N + 1) < 5
        vmin = V;
    else
        vmax = V;
    end
end
vmin % 3.7388
vmax % 3.7480