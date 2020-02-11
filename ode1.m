function y=ode1(fun,tspan,y0)
% solve y'=fun(y,t), y(t0)=y0 by forward euler method, similar interface to Matlab ode45
% in:
%   fun     function handle
%   tspan   vector of times
%   y0      initial value
% out:
%   y       solution at times tspan
% Jan Mandel, Feb 10 2020 

n=length(tspan);
y(1)=y0;
for i=1:n-1
    dt = tspan(i+1)-tspan(i);
    y(i+1)=y(i)+dt*fun(y(i),tspan(i));
end