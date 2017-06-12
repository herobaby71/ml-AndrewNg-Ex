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
lst = [0.01,0.03,0.1,0.3,1,3,10,30];
#error matrix
pred_matrix = zeros(length(lst));
for i_c = 1: length(lst)
  for j_sigma = 1: length(lst)
    predict= svmPredict(svmTrain(X, y, lst(i_c), @(x1, x2) gaussianKernel(x1, x2, lst(j_sigma))), Xval);
    error = double(predict~=yval);
    pred_matrix(i_c, j_sigma) = mean(error);
  end;
end;
temp = 0;
[temp, i_x]= min(pred_matrix);
[temp, i_y]= min(min(pred_matrix));
C = lst(i_x(i_y));
sigma = lst(i_y);
  







% =========================================================================

end
