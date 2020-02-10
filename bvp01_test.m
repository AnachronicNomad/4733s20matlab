% example 2.5
f = @(x)(3*x + x.^2).*exp(x);
sol = @(x)x.*(1-x).*exp(x);
n=10;
[u,x]=bvp01(f,n);
m=1000;
xx=[0:m+1]'/(m+1);
ss = sol(xx);
s = sol(x);
plot(x,u,'o--',xx,ss,'-');
legend('numerical','exact')
err=max(abs(s-u));
title([num2str(n),' points error ',num2str(err)])