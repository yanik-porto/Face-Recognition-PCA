function [EigVec EigVal] = doPCA(matrix)

d = size(matrix,2);
p = size(matrix,1);

for i=1:p
    matrix(i,:) = matrix(i,:) - sum(matrix(i,:))/d;
end

Eps = (1 / (p - 1)) * (matrix' * matrix);
% [U,S,V] = svd(Eps);
[EigVec,EigVal] = eig(Eps);


end