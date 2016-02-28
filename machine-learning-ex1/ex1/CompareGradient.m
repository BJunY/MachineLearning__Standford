function [] = CompareGradient(X, y, theta, alpha, num_iters)

[theta_BGD, J_history_BGD] = gradientDescent(X, y, theta, alpha, num_iters)
[theta_SGD, J_history_SGD] = StochasticGradientDescent(X, y, theta, alpha, num_iters)

plot([1:num_iters]', J_history_BGD, 'r');
hold on;

plot([1:num_iters]', J_history_SGD, 'g');
legend('Batch Gradient Decient','Stochastic Gradient Decient');
hold off;
%sprintf('theta of BGD :\n\t\t%f\n\t\t%f', theta_BGD(1), theta_BGD(2))
%sprintf('theta of SGD :\n\t\t%f\n\t\t%f', theta_SGD(1), theta_SGD(2))
