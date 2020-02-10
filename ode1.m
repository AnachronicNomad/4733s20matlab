function y=ode1(fun,tspan,y0)
% solve ODE by forward euler method
n=length(tspan);
y(1)=y0;
for i=1:n-1
    dt = tspan(i+1)-tspan(i);
    y(i+1)=y(i)+dt*fun(y(i),tspan(i));
end