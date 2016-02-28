function p = Bayesian(alpha, beta, X, y)
M = size(X, 2);
N = size(X, 1);
X = [ones(N, 1) X];
A = beta*X'*X + alpha;
mN = beta*pinv(A)*X'*y;
EmN = beta*(y - X*mN)'*(y - X*mN)/2 + alpha/2*mN'*mN;

p = @(alpha, beta)M/2*log(alpha) + N/2*log(beta) - EmN - 1/2*log(det(A)) - N/2*log(2*pi);