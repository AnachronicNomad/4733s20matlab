M=1;
tspan=[0:M]/M;
y=ode1(@(x,t)x,tspan,1);
plot(tspan,y)
hold on
fplot(@exp,[0,1])
grid on
hold off
legend('Euler method','exact solution')
err=y(M+1)-exp(1)
title([num2str(M),' steps, error=',num2str(err)])
