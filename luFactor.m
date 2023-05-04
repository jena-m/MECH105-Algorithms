function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix


if ~ismatrix(A) || size(A,1) ~= size(A,2)
    error('Please input a square matrix');
end

n = size(A,1);
L = eye(n);  
P = eye(n);  

for k = 1:n-1
    [~, maxIndex] = max(abs(A(k:n,k)));
    maxIndex = maxIndex + k - 1;
    if maxIndex ~= k
        A([k,maxIndex],k:n) = A([maxIndex,k],k:n);
        P([k,maxIndex],:) = P([maxIndex,k],:);
        if k > 1
            L([k,maxIndex],1:k-1) = L([maxIndex,k],1:k-1);
        end
    end
    for i = k+1:n
        factor = A(i,k) / A(k,k);
        L(i,k) = factor;
        A(i,k:n) = A(i,k:n) - factor * A(k,k:n);
    end
end

U = A;

end