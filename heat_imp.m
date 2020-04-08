function heat_imp(f,n,T)
% heat_imp(f,n,T)
% finite differences for the heat equation on (0,1) - explicit method
% f function handle
% n points in x
% T max time
% example: heat_exp(@(x)cos(2*pi*x),50,0.1)
if ~nargin, help(mfilename), return, end
dx=1/(n+1)
dt=0.5*dx*dx
r=dt/(dx*dx)
nt=ceil(T/dt);
v=zeros(n+2,1);
% vnew=v;
x=dx*[0:n+1]';
v(2:n+1)=f(x(2:n+1));
t=0;
one=ones(1,n+2)';
figure(gcf),clf, hold off   % clear and show figure window
% matrix A needs to produce u=A*v with  u(j)=v(j-1)-2*v(j)+v(j+1)
A=spdiags(ones(n,1)*[-1,2,-1],[-1,0,1],n,n);
for m=1:nt+1
    plot3(x,t*one,v),xlabel('x'),ylabel('t'),zlabel('v'),grid on,drawnow,hold on
    t = t+dt;
    % need indexing from 1:n+2 instead 0:n+1
    vnew=zeros(1,n+2)';
    % for j=2:n+1
    %    vnew(j) = v(j) + dt * (v(j-1)-2*v(j)+v(j+1))/(dx*dx);
    % end
    % solve for new v instead
    % start by writing the explicit code as
    vnew(2:n+1) = v(2:n+1) - (dt/(dx*dx))*A*v(2:n+1);
    v=vnew;
end
hold off
end