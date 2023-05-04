function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
%     1. x: x-values for our data set
%     2. y: y-values for our data set
%
%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
%     4. intercept: intercept from the linear regression y=mx+b
%     5. Rsquared: R^2, a.k.a. coefficient of determination

if length(x) ~= length(y)
    error("x and y arrays must be the same size")
end

[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder);
fX = sortedX;
fY = sortedY;

n = numel(fX);
Q1 = fY(floor((n+1)/4));
Q3 = fY(floor((3*n+3)/4));
IQR = Q3 - Q1;

outliers = fY < (Q1-(1.5*IQR)) | fY > (Q3 + (1.5*IQR));
fX = fX(~outliers);
fY = fY(~outliers);

xMean = mean(fX);
yMean = mean(fY);
SSx = sum((fX - xMean).^2);
SP = sum((fX - xMean).*(fY - yMean));
slope = SP/SSx;

intercept = yMean - slope.*(xMean);
fxi = slope*fX + intercept;

SSy = sum((fY - yMean).^2);
SSr = sum((fY - fxi).^2);
Rsquared = 1 - (SSr/SSy);


end
