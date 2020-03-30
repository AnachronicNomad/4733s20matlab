function heat_neumann(f,n)
syms x t
c0=2*int(f(x),x,0,1); 
cd0=double(c0);
for k=1:n
    c(k)=2*int(f(x)*cos(k*pi*x),x,0,1);
    cd(k)=double(c(k));
end
sol=c0/2;
for k=1:n
    sol = sol + c(k)*exp(-(k*pi)^2*t)*cos(k*pi*x);
end
sol