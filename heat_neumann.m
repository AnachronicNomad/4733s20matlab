function heat_neumann(f,n,T,N)
% compute and display the solution of the Neumann problem for the 
% heat equation
% in:
% f  function handle, must return matrix same dimension
% n  number of cosine terms 
% T  length of the time interval
% N  number of points to display in x and in t
c0=2*integral(f,0,1); 
for k=1:n
    c(k)=2*integral(@(x)f(x).*cos(k*pi*x),0,1);
end
[xx,tt]=ndgrid(linspace(0,1,N),linspace(0,T,N));
sol=c0*ones(size(xx))*0.5;
k=0;
show
for k=1:n
    sol = sol + c(k)*exp(-(k*pi)^2*tt).*cos(k*pi*xx);
    show
end
mesh(sol)
    function show
    mesh(xx,tt,sol),
    title(['n=',num2str(k)])
    xlabel('x')
    ylabel('time')
    drawnow
    pause(0.5)
    end
end


