function I = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

%Error check that the inputs are the same length
if length(x) ~= length(y)
    error('x and y must be the same length')
end

%Error check that the x input is equally spaced
dx = diff(x)
if ~all(abs(dx - dx(1)) < 1e-8)
    error('x must be equally spaced')
end

%Evaluates the integral
h = dx(1)
n = length(x) - 1;
I = y(1) + y(end) + 4*sum(y(2:2:end-1)) + 2*sum(y(3:2:end-1));

%Warn the user if the trapezoidal rule has to be used on the last interval
if mod(length(x),2) == 0
    warning('Odd number of intervals, the trapezoidal rule must be used for the last interval')
    I = I + (h/2)*(y(end - 1) + y(end));
end

I = I*(h/3);

end