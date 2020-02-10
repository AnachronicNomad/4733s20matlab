M=2
tspan=[0:M]/M;
y=ode1(@(x,t)x,tspan,1);
plot(tspan,y,'o--')
hold on
for i=1:length(tspan),
    fplot(@(x)y(i)*exp(x)/exp(tspan(i)),[tspan(i),1])
end
grid on
hold off
legend('Euler method','exact solution')
err=y(M+1)-exp(1)
title([num2str(M),' steps, error=',num2str(err)])
