% example 2.5
f = @(x)(3*x + x.^2).*exp(x);
sol = @(x)x.*(1-x).*exp(x);
n=10;
[u,x]=bvp(