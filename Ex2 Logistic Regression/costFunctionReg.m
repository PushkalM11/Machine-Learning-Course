function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


r_theta = theta
r_theta(1) = 0
h_theta = sigmoid((X * theta));
tmp_1 = ones(m, 1) - y;
tmp_2 = ones(m, 1) - h_theta;
J -= (sum(y .* log(h_theta)) + sum(tmp_1 .* log(tmp_2)));
J += ((lambda / 2) * sum(r_theta .^ 2));
J /= m;

tmp_4 = h_theta - y;
tmp_5 = (tmp_4 .* X);
grad = (sum(tmp_5))';

grad += (lambda * r_theta);
grad /= m;



% =============================================================

end