function [new_alpha, new_beta, J] =  Bayesian_LR( X, y, alpha, beta, iter_nums)
J = size(iter_nums,1);
M = size(X, 2);
N = size(X, 1);
%X = [ones(N, 1) X];


%options = optimoptions('fminunc','GradObj','on', MaxIter, 1500);
%p = M/2*log(alpha) + N/2*log(beta) - EmN - 1/2*log(det(A)) - N/2*log(2*pi);
%lam = value(1)/value(2);
fai = zeros(N, 4);
for i = 1:N,
    for j= 4,%2polynomial
        fai(i,j) = X(i)^(j - 1);
    end;
end;
X = fai;
value = eig(beta*X'*X);
m = length(value);

for k = 1:iter_nums,
    gama = 0;
    for i = 1:m,
        gama = gama + value(i)/(alpha + value(i));
    end;
    A = beta*X'*X + alpha;
    mN = beta*pinv(A)*X'*y;
    
    alpha = gama/(mN'*mN);
    beta = (N - gama)/((y - X*mN)'*(y - X*mN));
    EmN = beta*(y - X*mN)'*(y - X*mN)/2 + alpha/2*mN'*mN;
    J(k) = (M/2*log(alpha) + N/2*log(beta) - EmN - 1/2*log(det(A)) - N/2*log(2*pi))*N;
end;
new_alpha = alpha;
new_beta  = beta;

    


