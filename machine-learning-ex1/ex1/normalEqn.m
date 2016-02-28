function [] = normalEqn(X, y)
%NORMALEQN Computes the closed-form solution to linear regression 
%   NORMALEQN(X,y) computes the closed-form solution to linear 
%   regression using the normal equations.

theta = zeros(size(X, 2), 1);
plotData(X, y);

hold on;
N = length(X);
fai = zeros(N, 4);
for i = 1:N,
    for j= 1:4,%3polynomial
        fai(i,j) = X(i)^(j - 1);
    end;
end;
X = [ones(length(X), 1), X];
theta_optimal = pinv(X'*X)*X'*y;
X = fai;
% ====================== YOUR CODE HERE ======================
% Instructions: Complete the code to compute the closed form solution
%               to linear regression and put the result in theta.
%

% ---------------------- Sample Solution ----------------------

theta_0 = pinv(X'*X)*X'*y;
theta_1 = pinv(X'*X + 1)*X'*y;
theta_001 = pinv(X'*X + 0.01)*X'*y;
theta_100 = pinv(X'*X + 100)*X'*y;
theta_100000 = pinv(X'*X + 100000)*X'*y;
theta_B = pinv(X'*X + 92529/0.0452)*X'*y;

x1 = (linspace(-5, 40))';

v = [ones(100,1) ,x1, x1.^2, x1.^3];
plot([5 25], [[1 5]*theta_optimal,[1 25]*theta_optimal]);
plot(x1, v*theta_0, 'b-.');
plot(x1, v*theta_001, 'm--');
plot(x1, v*theta_1, 'g*');
plot(x1, v*theta_100, 'k');
plot(x1, v*theta_100000, 'c');
plot(x1, v*theta_B, 'y');
% -------------------------------------------------------------
hold off;
legend('sample point','lam = optimal','lam = 0','lam = 0.01', 'lam = 1', 'lam = 100', 'lam = 10000', 'lam = B');
axis([5, 25, 0, 30]);
% ============================================================

end
