function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);
m = length(X);
% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);
temp = size(centroids);
% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
dist = zeros(length(X), K);


for i = 1:K
    center = repmat(centroids(i, :), m, 1); 
    disp(center);
    dist(:, i) = sum((X - center).^2, 2);
end;
disp(dist);
[Y,idx] = min(dist,[],2);





% =============================================================

end

