function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


C_test = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
sigma_test = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];

i = 1;
j = 1;

error_matrix = zeros(size(C_test, 2), size(sigma_test, 2));

for C_train = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]
	for sigma_train = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30]
		
		model = svmTrain(X, y, C_train, @(x1, x2) gaussianKernel(x1, x2, sigma_train));
		y_cv_prediction = svmPredict(model, Xval);
		prediction_error = mean(double(y_cv_prediction ~= yval));
		error_matrix(i, j) = prediction_error;

		j += 1;

	end

	i += 1;
	j = 1;

end

minerr = min(min(error_matrix));
[row, col] = find(error_matrix == minerr);

C = C_test(1, row);
sigma = sigma_test(1, col);


% =========================================================================

end
