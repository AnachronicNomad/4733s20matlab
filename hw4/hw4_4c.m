% homework 4 problem 4c
% solve the pde  u_t=u_xx on (0,1), u(0)=u(1)=0, u(x,0)=sin(pi*x)^3
pi=4*atan(sym(1))
syms x t k
f = sin(pi*x)^3
c = simplify(2*int(f*sin(k*pi*x),x,0,1))
c1 = 2*int(f*sin(pi*x),x,0,1)
c3 = 2*int(f*sin(3*pi*x),x,0,1)
u = simplify(c1*exp(-pi^2*t)*sin(pi*x)+c3*exp(-(3*pi)^2*t )*sin(3*pi*x))
% latex(u)
u0 = expand(subs(u,t,0))
u0=sin(pi*x)*simplify(u0/sin(pi*x))
error_0 = u0 - f
error_u = diff(u,t)-diff(u,x,2)