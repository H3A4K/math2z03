% Question 1
% init
X = -3:0.1:3;
Y = -4:0.1:4;

dydx = zeros(length(X), length(Y));

% main
for a4 = 1:length(X)
    for b4 = 1:length(Y)        
        dydx(a4, b4) = sin(4 * X(a4) * Y(b4)) / (X(a4) ^ 2 + Y(b4) ^ 2 + 2 * X(a4) - 2 * Y(b4) + 3);
    end
end


[maximum, linear_index] = max(dydx(:));
[row, col] = ind2sub(size(dydx), linear_index);
rowval = X(row)
colval = Y(col)
% -1.1, 1.1

% Question 2
% init
[x4, y4] = meshgrid(-5:0.2:5, -5:0.2:5);
a2 = ones(size(x4));
b2 = sin(x4./ 5 + 4 * exp ((-y4.^2)./10));
a2scaled = a2./sqrt(a2.^2 + b2.^2);
b2scaled = b2./sqrt(a2.^2 + b2.^2);

% main
figure(1)
quiver(x4, y4, a2scaled, b2scaled)
axis equal;

% Question 4
% init
[x4, y4] = meshgrid(-2:0.2:2, -1:0.2:3);
a4 = ones(size(x4));
b4 = sin(x4./ 5 + 4 * exp ((-y4.^2)./10));
a4scaled = a4./sqrt(a4.^2 + b4.^2);
b4scaled = b4./sqrt(a4.^2 + b4.^2);

x5 = -2:0.1:2;
y5 = exp(x5.*(-3.6)) .* (exp(x5./10).* 10 - 9);

% main
figure(2)
quiver(x4, y4, a4scaled, b4scaled)
hold on;
axis equal;
plot(x5, y5, 'k', 'LineWidth', 2);
title('Alexander Perlock : 400619457');
xlabel('x'); ylabel('y');
xlim([-2, 2]); ylim([-1, 3]);