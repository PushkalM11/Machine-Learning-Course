function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

m = length(y);
neg_x_tmp = zeros(m);
neg_y_tmp = zeros(m);
pos_x_tmp = zeros(m);
pos_y_tmp = zeros(m);
neg_len = 0;
pos_len = 0;
i = 0;

for i = 1 : length(y)
	if isequal(y(i),0)
		neg_len += 1;
		neg_x_tmp(neg_len) = X(i, 1);
		neg_y_tmp(neg_len) = X(i, 2);
	else
		pos_len += 1;
		pos_x_tmp(pos_len) = X(i, 1);
		pos_y_tmp(pos_len) = X(i, 2);
	end
end

neg_x = neg_x_tmp(1:neg_len);
neg_y = neg_y_tmp(1:neg_len);
pos_x = pos_x_tmp(1:pos_len);
pos_y = pos_y_tmp(1:pos_len);

scatter(pos_x, pos_y)
hold on
scatter(neg_x, neg_y, 'filled')
hold off
legend('Admitted', 'Not Admitted','fontsize', 25)
xlabel('Exam 1 Score','fontsize', 25)
ylabel('Exam 2 Score','fontsize', 25)


% =========================================================================



hold off;

end
