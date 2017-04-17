function x0 = newtMethodLaunch()
% Launch Newton's method for finding roots.
% Assign the function and its derivative to variables.
f = @(x)x^3+x^2+2*x;
df = @(x)3*x^2+2*x+2;
% Provide an initial guess location of the root.
xi = 3;
% Tolerance of difference between the y-value of the current “root”
% and the acceptable root y-value.
diffY = 0.001;
% Call the root finding algorithm.
x0 = newtMethod(f,df,xi,diffY);
end

function out=newtMethod(f,df,xi,diffY)
realvalue=fzero(f,3)
x=xi
while x-realvalue>diffY
   fval = f(xi);
   fder = df(xi);
   xi = -(fval/fder)+xi;
   diffY = fval-f(xi);
end
end
