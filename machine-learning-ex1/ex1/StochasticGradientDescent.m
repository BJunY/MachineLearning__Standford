function [theta, J_history] = StochasticGradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);
n = length(theta);


for iter = 1:num_iters
   sum = zeros(size(theta));
    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    
        
    
      
      
          % for j = 1:n
           %     for i = 1:m
            %       sum(j) = sum(j) + alpha * (theta'*X(i,:)' - y(i))*X(i,j)/m;
            %    end
           
     
          
         %  end
       for i =1:m,
           for j = 1:n
             sum(j) = alpha * (theta'*X(i,:)' - y(i))*X(i,j)/m;
           end
           
            for j = 1:n
            theta(j) = theta(j) - sum(j);
            sum(j) = 0;
             end
       
       end
    
         





    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    %disp(J_history(iter));


end
