D = 5;
d = 1/8;
sigma = 1;

x = -D: d: D;
y = -D: d: D;

[xx, yy] = meshgrid(x, y);

rr = reshape(xx + 1i * yy, [], 1);

f = exp(-abs(rr) .^2 / sigma^2);
data = [real(rr), imag(rr), f];

writematrix(data, 'medium/c.csv')