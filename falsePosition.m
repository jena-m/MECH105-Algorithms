function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
% This function performs linear regression using the false position method to find the root of a function within a given interval.
% Inputs:
%   func - the function to be evaluated
%   xl - the lower bound of the interval
%   xu - the upper bound of the interval
%   es (optional) - the desired relative error (default value: 0.0001)
%   maxit (optional) - the maximum number of iterations (default value: 200)
%   varargin - additional arguments to be passed to the function
% Outputs:
%   root - the approximate root of the function
%   fx - the function value at the root
%   ea - the approximate relative error
%   iter - the number of iterations performed

if nargin < 3
    error('You must have at least 3 inputs, func, xl, xu')
end

if nargin < 4
    es = 0.0001;
    maxit = 200;
end

if nargin < 5
    maxit = 200;
end

iter = 0;
ea = 100;
oldRoot = 100;

while ea > es && iter < maxit
    
    iter = iter+1;
    
    root = xu - (func(xu)*(xl-xu))/(func(xl)-func(xu));
    fx = func(root);
    
    if fx == 0
        ea = 0;
    end
    
    if (fx < 0 && func(xl) < 0) || (fx > 0 && func(xl) > 0)
        xl = root;
    else 
        xu = root;
    end
    
    if iter >= 1 && fx ~= 0 
        ea = (abs(oldRoot - root) / root) * 100;
    end
    
    oldRoot = root;
    
end

end
